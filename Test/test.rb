require 'test/unit'
require './games.rb'

class TestDictionary < Test::Unit::TestCase
  
  def test_inizializer
    dictionary = Game.new
    assert_equal(dictionary.class, Game, "C'è un problema nella dichiarazione delle classi")
    assert_equal(dictionary.universal_dictionary.class, Hash, "C'è un problema nella dichiarazione delle classi")
  end
  
  def test_compare
    dictionary = Game.new
    assert_equal(dictionary.compare('carta','spock'), 'carta batte spock vince il giocatore 1')
    assert_equal(dictionary.compare('lucertola','spock'), 'lucertola batte spock vince il giocatore 1')
    assert_equal(dictionary.compare('spock','lucertola'), 'lucertola batte spock vince il giocatore 2')
    assert_equal(dictionary.compare('spock','carta'), 'carta batte spock vince il giocatore 2')
    assert_equal(dictionary.compare('spock','spock'), 'Parità')
  end
end