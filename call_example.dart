//import login_form_template_file

//create these variables
var userNameController = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();

defaultLoginForm(
          formKey: formKey,
          usernameController: userNameController,
          passwordController: passwordController,
          onPressed: ()
          {
            if(formKey.currentState!.validate())
            {
              print(userNameController.text);
              print(passwordController.text);
            }
          },
          suffixPressed: ()
          {
            setState(() {
              loginIsPassword = !loginIsPassword;
            });
          },
          textButtonOnPressed: ()
          {

          },
        )
