from MySQLdb import connect, OperationalError

try:
    db = connect(
        user='webdb',
        password='webdb',
        host='localhost',
        port=3306,
        db='webdb',
        charset='utf8')

    print('ok')

except OperationalError as e:
    print('미안합니다..... 조금 있다가 다시 시도 해주세요.')


# except OperationalError as e:
#   print(f'미안합니다..... 조금 있다가 다시 시도 해주세요. - {e}') 위에 거랑 똑같음
#   print(f'error: {e}')