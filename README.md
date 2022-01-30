# funda_assignment

A Flutter project assignment to demonstrate coding abilities.

# Getting Started

The project is a single screen that displays a simple property details as requested

## Run the project

Get the required dependency

```shell
$ flutter pub get
```

Generate the boilerplate

```shell
$ flutter pub run build_runner build
```

Run the project

```shell
$ flutter run
```
## Architecture

The project structure is feature based where I used BLoC/Cubit with some clean architecture aspects that eases testing and
scalability. It's 100% SOLID & DRY.

## Dependencies
- [get_it](https://pub.dev/packages/get_it)
- [injectable](https://pub.dev/packages/injectable)
- [connectivity_plus](https://pub.dev/packages/connectivity_plus)
- [freezed](https://pub.dev/packages/freezed) & [freezed_annotation](https://pub.dev/packages/freezed_annotation)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [http](https://pub.dev/packages/http)
- [intl](https://pub.dev/packages/intl)

#### Dev Dependencies
- [build_runner](https://pub.dev/packages/build_runner)
- [injectable_generator](https://pub.dev/packages/injectable_generator)
- [json_serializable](https://pub.dev/packages/json_serializable) & [json_annotation](https://pub.dev/packages/json_annotation)
- [mockito](https://pub.dev/packages/mockito)


## Test Test Test
Run
```shell
$ flutter test
```
I only added a simple unit testing for my service (for demonstration purposes only)