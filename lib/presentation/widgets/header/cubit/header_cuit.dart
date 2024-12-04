import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderCubit extends Cubit<HeaderState> {
  HeaderCubit() : super(HeaderInitial());

  // Update gender selection
  void updateGender(String gender) {
    emit(HeaderGenderUpdated(gender));
  }

  // Update user profile image
  void updateProfileImage(String imageUrl) {
    emit(HeaderProfileUpdated(imageUrl));
  }
}

// Header State classes
abstract class HeaderState {}

class HeaderInitial extends HeaderState {}

class HeaderGenderUpdated extends HeaderState {
  final String gender;
  HeaderGenderUpdated(this.gender);
}

class HeaderProfileUpdated extends HeaderState {
  final String imageUrl;
  HeaderProfileUpdated(this.imageUrl);
}
