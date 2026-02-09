-- tests/test_collection_spec.lua

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

    it("each", function()
        local birds = collect({'bat', 'bird', 'bee'})

        local loops = 0
        birds:each(function(item)
            assert.are.equal(true, item:sub(1, 1) == 'b')
            loops = loops + 1
        end)

        assert.are.equal(3, loops)
    end)

    it("is_empty", function()
        local animals = collect()

        assert.are.equal(true, animals:is_empty())
    end)

    it("is_not_empty", function()
        local animals = collect({ 'fish', 'dog', 'cat' })

        assert.are.equal(true, animals:is_not_empty())
    end)
end)
