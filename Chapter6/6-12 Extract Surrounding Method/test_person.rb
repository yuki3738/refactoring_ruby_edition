# frozen_string_literal: true

require 'test/unit'
require_relative 'person'

class TestPerson < Test::Unit::TestCase
  def setup
    @mother = Person.new('Mom', '1950/01/01')
    @child1 = Person.new('Child1', '1970/01/01', nil, @mother)
    @child2 = Person.new('Child2', '1972/01/01', '2000/01/01', @mother)  # this child is not alive
    @grandchild1 = Person.new('Grandchild1', '1990/01/01', nil, @child1)
    @grandchild2 = Person.new('Grandchild2', '1992/01/01', nil, @child1)
  end

  def test_alive
    assert_equal(true, @mother.alive?)
    assert_equal(true, @child1.alive?)
    assert_equal(false, @child2.alive?)
    assert_equal(true, @grandchild1.alive?)
    assert_equal(true, @grandchild2.alive?)
  end

  def test_number_of_living_descendants
    assert_equal(3, @mother.number_of_living_descendants)
    assert_equal(2, @child1.number_of_living_descendants)
    assert_equal(0, @child2.number_of_living_descendants)
  end

  def test_number_of_descendants_named
    assert_equal(1, @mother.number_of_descendants_named('Child1'))
    assert_equal(0, @mother.number_of_descendants_named('Child3'))
  end
end
