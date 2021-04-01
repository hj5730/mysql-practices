# l이면 리스트 보여주고, a하면 추가하고, q하면 그 창 나가기
# from emaillistapp.model import findall
# results = findall()

from emaillistapp import model

def run_list():
    results = model.findall()
    for result in results:
        print(f'{index}:{result["first_name"]}{result["last_name"]}:{result["email"]}')
        index = index + 1
        # {} : 딕셔너리 이므로 [] 안에 칼럼 값을 주어 value 값 지정.

def run_add():
    firstname = input('first name: ')
    lastname = input('last name: ')
    email = input('email: ')

    model.insert(firstname, lastname, email)

    run_list()

def run_delete():
    email = input('email: ')
    model.deletebyemail(email)
    run_list()

def main():
    while True:
        cmd = input(f'(l)list, (a)add, (d)delete, (q)quit > ')

        if cmd == 'q':
            break # while문을 빠져나와라.
        elif cmd == 'l':
            run_list() # list를 실행하라.
        elif cmd == 'a':
            run_add() # add를 실행하라.
        elif cmd == 'd':
            run_delete()
        else:
            print('알 수 없는 메뉴입니다.')

        print(f'execute {cmd}')

if __name__ == '__main__':
    main()

# sol1
    # def run_list():
    # results = model.findall()
    # for result in results:
    # print(f'{result["no"]}:{result["first_name"]}{result["last_name"]}:{result["email"]}')

# sol2
# def run_list():
#     results = model.findall()
#     for index, result in enumerate(results):
#     print(f'{index+1}:{result["first_name"]}{result["last_name"]}:{result["email"]}')

# sol3
# def run_list():
#     results = model.findall()
#     for result in results:
#         print(f'{index}:{result["first_name"]}{result["last_name"]}:{result["email"]}')
#         index = index + 1