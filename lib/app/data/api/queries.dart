class Queries {
  static const mutationLogin = """
    mutation {
      login(
        email: ":email",
        password: ":password",
        userType: Student
      ) {
        token
      }
    }
  """;

  static const isEmailAlreadyInUse = """
    query {
      isEmailAlreadyInUse(
        email: ":email",
      )
    }
  """;

  static const mutationSetNewPassword = """
    mutation {
      changeStudentPassword(
        email: ":email",
        password: ":password",
        birthday: {:birthday}
      )
    }
  """;

  static const getUserIdByEmailAndBirthdayDate = """
    query {
      getUserIdByEmailAndBirthdayDate(
        email: ":email",
        birthday: {:birthday}
      )
    }
  """;
}
