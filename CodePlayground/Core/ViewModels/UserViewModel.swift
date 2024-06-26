//
//  UserViewModel.swift
//  CodePlayground
//
//  Created by Александр Новиков on 28.05.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol AuthentificationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class UserViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    init() {
        self.userSession = Auth.auth().currentUser
        Task {
           try await fetchUser()
        }
    }

    func createUser(withEmail email: String, password: String, firstName:String, lastName:String, nickName: String ) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, firstName: firstName, lastName: lastName, nickName: nickName, email: email)
            let encodeUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
            try await fetchUser()
        } catch {
            print("Debug: failed to create user with error \(error.localizedDescription)")
        }
    }

    func fetchUser() async throws {
        do {
            guard let uid = Auth.auth().currentUser?.uid else {return}
            guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
            self.currentUser = try snapshot.data(as: User.self)
        } catch {
            print("Debug: failed to fetch user with error \(error.localizedDescription)")
        }
    }

    func signIn(withEmail email:String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await fetchUser()
        } catch {
            print("Debug: failed to sign in with error \(error.localizedDescription)")
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("Debug: failed to sign out with error \(error.localizedDescription)")
        }
    }

    func deleteUserAccount() {
        guard let user = Auth.auth().currentUser else{return}
        user.delete()
        self.userSession = nil
        self.currentUser = nil
    }

    func createProject(name: String) async {
        guard let user = currentUser else {return}
        let newProject = PlaygroundProject(name: name)
        let projectViewModel = ProjectViewModel(project: newProject)
        user.projects.append(projectViewModel)
        await updateUser(user: user)
    }

    func deleteProject(byID id: String) async {
        guard let user = currentUser else {return}
        if let index = user.projects.firstIndex(where: {$0.getID() == id}) {
            user.projects.remove(at: index)
            await updateUser(user: user)
        } else {
            return
        }
    }

    func changeProjectName(newName: String, id: String) async {
        guard let user = currentUser else {return}
        if let index = user.projects.firstIndex(where: {$0.getID() == id}) {
            user.projects[index].changeName(name: newName)
            await updateUser(user: user)
        } else {
            return
        }
    }

    func updateUser(user: User) async {
            do {
                let encodeUser = try Firestore.Encoder().encode(user)
                try await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
                try await fetchUser()
            } catch {
                print("Failed to update user: \(error)")
            }
    }
}
