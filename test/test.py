def add(a, b):
    """2つの数を加算する関数"""
    return a + b

def subtract(a, b):
    """2つの数を減算する関数"""
    return a - b

def multiply(a, b):
    """2つの数を乗算する関数"""
    return a * b

def divide(a, b):
    """2つの数を除算する関数"""
    if b == 0:
        raise ValueError("0で除算することはできません")
    return a / b

def main():
    x = 10
    y = 5

    print("加算:", add(x, y))
    print("減算:", subtract(x, y))
    print("乗算:", multiply(x, y))
    print("除算:", divide(x, y))

if __name__ == "__main__":
    main()
