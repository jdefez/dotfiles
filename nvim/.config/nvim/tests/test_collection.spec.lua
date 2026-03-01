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
        local animals = collect({ foo = 'bar' })

        animals:put('biz', 'boom')

        assert.are.equal('boom', animals:get('biz'))
        assert.are.equal('bar', animals:get('foo'))
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
end)
