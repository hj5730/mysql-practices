from MySQLdb import connect, OperationalError

try:
    # 연결
    db = connect(
        user='webdb',
        password='webdb',
        host='localhost',
        port=3306,
        db='webdb',
        charset='utf8')

    # cursor 생성
    cursor = db.cursor()  # cursor: 쿼리 날려주는 것

    # SQL 실행
    sql = 'insert into emaillist values(null, "마", "이콜", "michol@naver.com")'
    count = cursor.execute(sql)

    # 자원 정리
    cursor.close()
    db.close()

    # 결과 보기
    print(f'실행 결과: {count==1}')

except OperationalError as e:
    print(f'error: {e}')