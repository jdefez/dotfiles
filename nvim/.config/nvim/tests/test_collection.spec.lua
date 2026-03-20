describe("collection module tests", function()
    local collect = require("modules.collection").collect

    it("instantiates", function()
        local insects = collect({ 'ant', 'bee', 'butterfly' })

        assert.are.equal(3, insects:count())

        local animals = collect({ 'dog', 'cat', 'mouse', 'bird' })

        assert.are.equal(4, animals:count())
        assert.are_false(insects == animals)
    end)

    it("push", function()
        local animals = collect()

        assert.are.equal(true, animals:is_empty())
        assert.are.equal(false, animals:push('dog', 'cat'):is_empty())
        assert.are.equal(2, animals:count())
    end)

    it("put", function()
        local animals = collect({ foo = 'bar', zoom = 'boo' })

        animals:put('biz', 'boom')

        assert.are.equal('boom', animals:get('biz'))
        assert.are.equal('bar', animals:get('foo'))
        assert.are.equal('boo', animals:get('zoom'))
    end)

    it("merge", function()
        local animals = collect({ 'bar' })
        local dogs = collect({ 'doggy' })

        assert.are.equal(2, animals:merge(dogs):count())
    end)

    it("shift", function()
        local animals = collect({ 'dog', 'cat', 'mouse', 'bird' })
        assert.are.equal('dog', animals:shift())
        assert.are.equal(3, animals:count())
    end)

    it("pop", function()
        local animals = collect({ 'dog', 'cat', 'mouse', 'bird' })
        assert.are.equal('bird', animals:pop())
        assert.are.equal(3, animals:count())
    end)

    it("each", function()
        local birds = collect({ 'bat', 'bird', 'bee' })

        local loops = 0
        birds:each(function(item)
            assert.are.equal(true, item:sub(1, 1) == 'b')
            loops = loops + 1
        end)

        assert.are.equal(3, loops)
    end)

    it("filter", function()
        local animals = collect({ 'dog', 'cat', 'mouse', 'bird' })
        local dogs = animals:filter(function(value)
            return value == 'dog'
        end)

        assert.are.equal(1, dogs:count())
    end)

    it("is_empty", function()
        local animals = collect()

        assert.are.equal(true, animals:is_empty())
    end)

    it("is_not_empty", function()
        local animals = collect({ 'fish', 'dog', 'cat' })

        assert.are.equal(true, animals:is_not_empty())
    end)

    it("contains a value", function()
        local animals = collect({ 'dog', 'cat', 'mouse' })

        assert.are.equal(true, animals:contains('dog'))
        assert.are.equal(false, animals:contains('bird'))
    end)

    it("contains with a predicate function", function()
        local animals = collect({ 'dog', 'cat', 'mouse' })

        assert.are.equal(true, animals:contains(function(value)
            return value == 'cat'
        end))
        assert.are.equal(false, animals:contains(function(value)
            return value == 'bird'
        end))
    end)

    it("contains a key-value pair", function()
        local animals = collect({ name = 'dog', type = 'mammal' })

        assert.are.equal(true, animals:contains('name', 'dog'))
        assert.are.equal(false, animals:contains('name', 'cat'))
    end)

    it("some", function()
        local animals = collect({ 'dog', 'cat', 'mouse', 'bird' })

        assert.are.equal(true, animals:some(function(value)
            return value == 'bird'
        end))
    end)

    it("every", function()
        local birds = collect({ 'bat', 'bird', 'bee' })

        assert.are.equal(true, birds:every(function(value)
            return value:sub(1, 1) == 'b'
        end))
    end)

    it("diff", function()
        local animals = collect({ 'bird', 'cat', 'moose' })
        local dogs = collect({ 'dog', 'cat', 'moose' })

        local diff = animals:diff(dogs)
        assert.are.equal(1, diff:count())
        assert.are.equal('bird', diff:first())
    end)

    it("keys of an array", function()
        local animals = collect({ 'dog', 'cat', 'mouse', 'bird' })
        local keys = animals:keys()
        assert.are.equal(4, #keys)

        local expected = { 1, 2, 3, 4 }
        for index, key in ipairs(keys) do
            assert.are.equal(true, type(key) == 'number')
            assert.are.equal(expected[index], key)
        end
    end)

    it("keys of an associative array", function()
        local asociative = collect({ foo = 'bar', baz = 'boom' })
        local keys = asociative:values()
        assert.are.equal(2, #keys)
        -- TODO: check keys members
    end)

    it("values of an array", function()
        -- array like test
        local animals = collect({ 'dog', 'cat', 'mouse', 'bird' })
        local values = animals:values()
        assert.are.equal(4, #values)
        for index, value in ipairs(values) do
            assert.are.equal(true, type(value) == 'string')
            assert.are.equal(value, animals:get(index))
        end
    end)

    it("values of an associative array", function()
        -- associative test
        local asociative = collect({ foo = 'bar', baz = 'boom' })
        local values = asociative:values()

        assert.are.equal(2, #values)

        local expected = { 'bar', 'boom' }
        for index, value in ipairs(values) do
            assert.are.equal(true, type(value) == 'string')
            assert.are.equal(expected[index], value)
        end
    end)

    it("count", function()
        local animals = collect({ 'dog', 'cat', 'mouse', 'bird' })
        assert.are.equal(4, animals:count())

        local associative = collect({ foo = 'bar', baz = 'boom' })
        assert.are.equal(2, associative:count())
    end)
end)
