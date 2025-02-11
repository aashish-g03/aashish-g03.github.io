import 'dart:async';
import 'package:aerium/infrastructure/api/email_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:meta/meta.dart';

part 'email_event.dart';

part 'email_state.dart';

part 'email_bloc.freezed.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailRepository _emailRepository;

  EmailBloc(this._emailRepository) : super(EmailState.initial()) {
    on<EmailEvent>(_onEmailEvent);
  }

  Future<void> _onEmailEvent(EmailEvent event, Emitter<EmailState> emit) async {
    emit(EmailState.sendingEmail());

    final response = await _emailRepository.sendEmail(
      name: event.name,
      email: event.email,
      subject: event.subject,
      message: event.message,
    );

    response.fold(
      (failure) => emit(EmailState.failure()),
      (data) => emit(EmailState.emailSentSuccessFully()),
    );
  }
}
