/*
 
 Курсовой проект “Основы Swift”
 В качестве курсового проекта вы разработаете функцию для расчета времени пути на общественном транспорте.

 В вашем городе появилась новая трамвайная ветка. Правительство города решило, что нужно добавить в мобильное приложение функционал по подсчету времени, затраченному на поездку, чтобы жители могли заранее планировать время. Ваша задача написать функцию, в которую будете передавать названия начальной и конечной остановки, и функция будет расчитывать время, затраченное на поездку.

 Требования к коду
 Код должен запускаться без ошибок;
 Должен соблюдаться стиль кода;
 Обратите внимание на названия переменных и функций. Названия должны быть говорящими, но ёмкими.
 Алгоритм решения
 Создайте коллекцию. Вид коллекции вы должны определить сами.
 Наполните коллекцию данными. Названия остановок общественного транспорта (минимум 7) и время проезда между остановками (время задайте самостоятельно). Для упрощения можно указывать время проезда от первой остановки. То есть первая остановка - 0 минут, вторая остановка - 7 минут (0 + 7), третья остановка - 11 минут (7 + 4) и т.д.
 Создайте функцию, которая будет принимать начальную и конечную остановку (тип string) и возвращать время, затраченное на поездку (тип Int).
 Нужно учитывать, что остановки в функцию можно передавать в любом порядке. Например, начальная остановка - остановка 3, конечная остановка - остановка 8. Или начальная остановка - остановка 2, конечная остановка - остановка 6.
 Подсказка:
 можно комбинировать несколько коллекций, но коллекция должна быть одна. То есть нельзя использовать, например, два массива.

 Нужно предусмотреть проверку названия остановок на наличие ошибок. В случае если название введено не верно, то выводить информацию об этом в консоль.
 Алгоритм должен сам определять, в каком направлении двигается пассажир. Так как не все коллекции имеют упорядоченные значения, нужно пронумеровать порядок остановок на пути для облегчения решения задачи.

 
 */

//Определяем тип колекции - словарь у которого ключ - имя остановки а значения - кортеж с номером станции и временем которое требуется чтобы добраться до нее от станции один)
typealias RailRoadLine = [String : (stationIndex : Int, timeFromStart : Int)]

var railRoadLine1 : RailRoadLine = ["Витебский вокзал" : (1,0),
                                    "Боровая" : (2,3),
                                    "Воздухоплавательный парк" : (3,7),
                                    "Проспект славы" : (4,15),
                                    "Купчино" : (5,22),
                                    "Шушары" : (6,29),
                                    "Паравозный музей" : (7,36)]


func tripTime (station1 : String, station2 : String) -> Int? {
    // по заданию сказано что нужно работать с номерами станций - по мне они сейчас нам не нужны но пусть будут - разбираем значение словаря на индекс и время - если ошибок нет - возвращаем разницу во времени (по модулю)
//
//    if let (index1,time1) = railRoadLine1[station1] {
//        if let (index2,time2) = railRoadLine1[station2] {
//            return abs(time2-time1)
//        }
//    }
//    // если станция введена не верно - выводим ошибку в консоль и возвращаем nil
//    print("Проверьте название станции")
//    return nil
    
    
// сделаем тоже самое с конструкцией guard
    guard let (_,time1) = railRoadLine1[station1],let (_,time2) = railRoadLine1[station2] else {
        print("Проверьте название станции")
        return nil
    }
    return abs(time2-time1)
}



// все верно указано:
if let tripTime = tripTime(station1: "Купчино", station2: "Боровая") {
    print("Поезда между станциями Купчино и Боровая займет \(tripTime) мин.")
}

// сознательно делаем ошибку в названии станции:
if let tripTime = tripTime(station1: "Купчино", station2: "Борjовая") {
    print("Поезда между станциями Купчиноо и Боровая займет \(tripTime) мин.")
}

//add new code here
