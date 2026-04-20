## Название проекта

Задание 1. Переключение фонового изображения.

## Описание

iOS-приложение на Swift с `UISwitch`, который меняет фон между двумя
изображениями:

- положение **ON** — `bg1.jpg`;
- положение **OFF** — `bg2.jpg`.

## Установка

1. Создать новый проект Xcode типа `App`, язык `Swift`, интерфейс `Storyboard`.
2. Скопировать `ViewController.swift` в проект.
3. Открыть `Main.storyboard`, добавить `UISwitch` и `UILabel`.
4. Связать элементы:
   `backgroundSwitch` — `IBOutlet`,
   `switchIndicator` — `IBOutlet`,
   `backgroundSwitchTapped` — `IBAction`.
5. Добавить изображения `bg1` и `bg2` в `Assets.xcassets`.

## Использование

Запустить приложение и переключать `UISwitch` для смены фонового изображения.

## Авторы

Ivan Nasennik — Group 12b

## Ссылки и дополнительные сведения

- Исходный файл контроллера: `task1/ViewController.swift`
- В коде использованы аннотации `MARK`, `TODO` и `FIXME`
