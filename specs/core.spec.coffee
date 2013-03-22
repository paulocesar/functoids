h = require('./test-helper')

F = h.requireSrc()

describe 'Core functions', ->
    it 'tells good from bad', () ->
        goodStuff = ['pink moon', '  whitespace  ', 10, 0, {}, new Date(), []]
        badStuff = [null, undefined, '   ']

        for g in goodStuff
            F.isGood(g).should.be.true
            F.isBad(g).should.be.false

        for b in badStuff
            F.isBad(b).should.be.true
            F.isGood(b).should.be.false

    it 'throws properly formatted exceptions', ->
        f = () -> F.throw("My", "choppy", "exception", "message")
        f.should.throw("My choppy exception message")

        faulkner = ["I give you the mausoleum of all hope and desire... I give it to you not that"
            "you may remember time, but that you might forget it now and then for a moment and"
            "not spend all of your breath trying to conquer it. Because no battle is ever won"
            "he said. They are not even fought. The field only reveals to man his own folly and"
            "despair, and victory is an illusion of philosophers and fools."]

        f = () -> F.throw.apply(null, faulkner)
        expected = "
I give you the mausoleum of all hope and desire... I give it to you not that you may remember time,
 but that you might forget it now and then for a moment and not spend all of your breath trying
 to conquer it. Because no battle is ever won he said. They are not even fought. The field only
 reveals to man his own folly and despair, and victory is an illusion of philosophers and fools."

        f.should.throw(expected)

