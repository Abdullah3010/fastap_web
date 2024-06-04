part of 'share_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class GetProfileSuccess extends ProfileState {}

final class GetProfileError extends ProfileState {}

final class ChangeProfileNumber extends ProfileState {}
