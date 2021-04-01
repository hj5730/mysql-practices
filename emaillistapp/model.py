# 크게 함수가 2개 있음

from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor

def findall(): # app 에다가 주는 것
    try:
        # 연결
        db = conn()

        # cursor 생성
        cursor = db.cursor(DictCursor)  # cursor: 쿼리 날려주는 것

        # SQL 실행
        sql = 'select no, first_name, last_name, email from emaillist order by no desc'
        cursor.execute(sql)

        # 결과 받아오기
        results = cursor.fetchall()

        # 자원 정리
        cursor.close()
        db.close()

        # 결과 반환
        return results

    except OperationalError as e:
        print(f'error: {e}')

def insert(firstname, lastname, email): # app 에서 가져오는 것
    # 연결
    db = conn()

    # cursor 생성
    cursor = db.cursor()  # cursor: 쿼리 날려주는 것

    # SQL 실행
    sql = 'insert into emaillist values(null, %s, %s, %s)'
    count = cursor.execute(sql, (firstname, lastname, email))

    # commit
    db.commit()

    # 자원 정리
    cursor.close()
    db.close()

    # 결과 반환
    return count == 1

except OperationalError as e:
print(f'error: {e}')


def conn():
    return connect(
        user='webdb',
        password='webdb',
        host='localhost',
        port=3306,
        db='webdb',
        charset='utf8')