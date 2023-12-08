import React, { useState, useEffect } from 'react';
import firebase from 'firebase/compat/app';
import 'firebase/compat/auth';


import { initializeApp } from "firebase/app";

const firebaseConfig = {
  apiKey: "AIzaSyCR337mlxq55VzX4jeOg-oxlUphcCBKHt8",
  authDomain: "login15601-17150.firebaseapp.com",
  projectId: "login15601-17150",
  storageBucket: "login15601-17150.appspot.com",
  messagingSenderId: "140109813515",
  appId: "1:140109813515:web:7041981fb3224a1be7f40e"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

firebase.initializeApp(firebaseConfig);

const Login = () =>{
    const [email, setEmail] =useState('');
    const [password, setPassword] = useState('');

    useEffect(()=>{
        if (!firebase.app.length){
            initializeApp(firebaseConfig);
        }
    }, []);

    const handleLogin = async () =>{
        try {
            const response = await firebase.auth().signInWithEmailAndPassword(email, password);
            alert('Bienvenido');
            console.log('Inicio de sesion exitoso ' , response.user);
        }catch(error){
            alert('Usuario y/o contraseña invalidos');
            console.error('Error durante el inicio de sesion ' , error.message);
            //Puedes manejar el error de inicio aqui
        }
    };
    
    return (
        <div>
            <h2>Login</h2>
            <label>Email:</label>
            <input type="email" value={email} onChange={(e) => setEmail(e.target.value)}/>
            <br/>
            <label>Password:</label>
            <input type="password" value={password} onChange={(e) => setPassword(e.target.value)}/>
            <br/>
            <button onClick={handleLogin}>Login</button>
        </div>
    )
}

export default Login;
