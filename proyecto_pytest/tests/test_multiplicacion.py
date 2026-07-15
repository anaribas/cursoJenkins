import pytest

def multiplicar(a,b):
    """ Función que multiplica dos números """
    return a * b

def test_multiplicar():
    assert multiplicar(1,2) == 2
    assert multiplicar(-1,1) == -1
    assert multiplicar(0,100) == 0

def test_multiplicar_fail():
    with pytest.raises(TypeError):
        assert multiplicar(1, 2) == 4