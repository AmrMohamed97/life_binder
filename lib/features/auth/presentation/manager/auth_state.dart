abstract class AuthState{}
class AuthInitialState extends AuthState{}
class SignInLoadingState extends AuthState{}
class RegisterLoadingState extends AuthState{}
class SignInSuccessState extends AuthState{}
class SignInErrorState extends AuthState{}
class RegisterSuccessState extends AuthState{}
class RegisterErrorState extends AuthState{}

class ChangeLoadingState extends AuthState{}