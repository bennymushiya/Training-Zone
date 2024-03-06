//
//  RegistrationController.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit
import FirebaseFunctions
import Firebase


class RegistrationController: UIViewController {
    
    //MARK: - PROPERTIES
    
    private lazy var cancelButton: ReusableButtons = {
        let button = ReusableButtons(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.backgroundColor = .systemGray5
        button.setDimensions(height: 34, width: 74)
        button.layer.cornerRadius = 34 / 2
        
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var loginButton: ReusableButtons = {
        let button = ReusableButtons(type: .system)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.backgroundColor = .systemGray5
        button.setDimensions(height: 34, width: 74)
        button.layer.cornerRadius = 34 / 2
        
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

        return button
    }()
    
    private let gymNameLabel: ReusableLabel = {
        let label = ReusableLabel(title: "Training Zone", size: 30, weight: .black, textColors: .white, alignment: .center)
        
        return label
    }()
    
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 50
        
        return view
    }()
    
    private let titleLabel: ReusableLabel = {
        let label = ReusableLabel(title: "Lets Get Started", size: 25, weight: .black, textColors: .black, alignment: .left)
        
        return label
    }()
    
    private let subTitleLabel: ReusableLabel = {
        let label = ReusableLabel(title: "sign up to become a member", size: 16, weight: .semibold, textColors: .darkGray, alignment: .left)
        
        return label
    }()
    
    private let nameTextField: CustomTextField = {
        let tf = CustomTextField(placeHolder: "name")
        
        tf.addTarget(self, action: #selector(handleEditingChanged), for: .editingChanged)
        
        return tf
    }()
    
    private let emailTextField: CustomTextField = {
        let tf = CustomTextField(placeHolder: "email")
        
        tf.addTarget(self, action: #selector(handleEditingChanged), for: .editingChanged)

        return tf
    }()
    
    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeHolder: "password")
        tf.isSecureTextEntry = true
        
        tf.addTarget(self, action: #selector(handleEditingChanged), for: .editingChanged)
        
        return tf
    }()
    
    private let registerButton: ReusableButtons = {
        let button = ReusableButtons(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.isEnabled = false
        button.alpha = 0.5
        
        button.addTarget(self, action: #selector(handleRegisterUser), for: .touchUpInside)
        
        return button
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.setHeight(1)
        
        return view
    }()
    
    private let descriptionLabel: ReusableLabel = {
        let label = ReusableLabel(title: "Or sign up with", size: 12, weight: .semibold, textColors: .darkGray, alignment: .center)
        label.backgroundColor = .white
        
        return label
    }()
    
    private let registerWithGoogleButton: ReusableButtons = {
        let button = ReusableButtons(type: .system)
        button.setImage(UIImage(systemName: "goforward"), for: .normal)
        button.setTitle(" Sign Up with Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = .white
        button.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(handleGoogle), for: .touchUpInside)
        
        return button
    }()
    
    private var viewModel = AuthentificationViewModel()
    private lazy var stripeId = String()
    private lazy var userId = String()
    
    //MARK: - LIFEYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    
    //MARK: - HELPERS
    
    func configureUI() {
        
        view.backgroundColor = .systemCyan
        
        let topStack = UIStackView(arrangedSubviews: [cancelButton, loginButton])
        topStack.axis = .horizontal
        topStack.distribution = .equalSpacing
        
        view.addSubview(topStack)
        topStack.centerX(inView: view)
        topStack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        view.addSubview(gymNameLabel)
        gymNameLabel.centerX(inView: view)
        gymNameLabel.anchor(top: topStack.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        view.addSubview(whiteView)
        whiteView.centerX(inView: view)
        whiteView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 200, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        let titleStack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        titleStack.axis = .vertical
        titleStack.spacing = 10
        
        whiteView.addSubview(titleStack)
        titleStack.anchor(top: whiteView.topAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 60, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        let textfieldStack = UIStackView(arrangedSubviews: [nameTextField, emailTextField, passwordTextField])
        textfieldStack.axis = .vertical
        textfieldStack.spacing = 20
        
        whiteView.addSubview(textfieldStack)
        textfieldStack.centerX(inView: whiteView)
        textfieldStack.anchor(top: titleStack.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        whiteView.addSubview(registerButton)
        registerButton.centerX(inView: whiteView)
        registerButton.anchor(top: textfieldStack.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        whiteView.addSubview(divider)
        divider.centerX(inView: whiteView)
        divider.anchor(top: registerButton.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        whiteView.addSubview(descriptionLabel)
        descriptionLabel.centerX(inView: whiteView)
        descriptionLabel.anchor(top: registerButton.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 35, paddingLeft: 130, paddingBottom: 0, paddingRight: 130)
        
        whiteView.addSubview(registerWithGoogleButton)
        registerWithGoogleButton.centerX(inView: whiteView)
        registerWithGoogleButton.anchor(top: descriptionLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
    }
  
    
    //MARK: - ACTION

    func updateButton() {
        
        registerButton.isEnabled = viewModel.enableRegisterButton
        registerButton.alpha = viewModel.changeButtonOpacity
        
    }
    
    
    // creates a stripe customer
    func createStripeCustomer(email: String, password: String)  {
       
        showActivityIndicator(message: "Please wait")

        Auth.auth().createUser(withEmail: email, password: password) { results, error in
            self.dismissActivityIndicator()
            if let error = error {
                
                print("DEBUGG: YOU FAILED TO CREATE USER UNOE \(error)")
                
                return
            }
            
            Functions.functions().httpsCallable("createStripeUser").call(["email": email]) { results, error in
                
                if let error = error {
                    
                    print("DEBUGG: FAILED TO CREATE STRIPE USER BECAUSE \(error)")
                    
                    return
                }
                                
                print("DEBUGG: SUCCESSFULLY LOGGED USER IN ")
                
                
            }
        }
    }
    
    func createFirebaseUser()  {
        
        guard let fullname = nameTextField.text else {return}
        guard let email = emailTextField.text else {return}
        guard let passowrd = passwordTextField.text else {return}
        
        let credentials = AuthCredentials(fullname: fullname, email: email, password: passowrd, isMember: true, stripeId: " ", membershipType: "")
        
         UserServices.storeUserInformation(credentials: credentials) { error in
            
            if let error = error {
                
                print("DEBUGG: FAILED TO CREATE THE USER FOR THIS ONE UNOE \(error)")
            
                return
            }
            
            self.dismiss(animated: true, completion: nil)
            print("DEBUGG: SUCCESSFULLY CREATED A FIREBASE USER WITH EVRYTHING ")
        }
        
    }
    
    
    //MARK: - SELECTORS
    
    @objc func handleEditingChanged(sender: UITextField) {
        
        if sender == nameTextField {
            
            viewModel.name = sender.text ?? ""
            
        } else if sender == emailTextField {
            
            viewModel.email = sender.text ?? ""
            
        } else {
            
            viewModel.password = sender.text ?? ""
        }
        
        updateButton()
    }
    
    
    @objc func handleCancel() {
                
        dismiss(animated: true)
        
    }
    
    @objc func handleLogin() {
        
        print("login up ")
        
    }
    
    
    @objc func handleRegisterUser()  {
    
        createFirebaseUser()
        
    }
    
    
    
    @objc func handleGoogle() {
        
        print("signing up with google ")
        
    }
}
