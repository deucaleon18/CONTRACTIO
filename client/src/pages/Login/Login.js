import React,{useState,useEffect} from 'react'
import './Login.css'
import axios from 'axios'



const Login = () => {
  const [username, setUsername] = useState("");
  const [password,setPassword]=useState("")
  
    // Handler function
    const handleSubmit = async (event) => {
      event.preventDefault();
    


      // const data = new FormData(event.currentTarget);
      // eslint-disable-next-line no-console
  
      await axios
        .post("http://localhost:5000/login", {
          username,
          password,
        })
        .then((res) => {
          console.log(res);
          localStorage.setItem("token", res.data.token);
          localStorage.setItem("username", res.data.user.username);
          localStorage.setItem("email", res.data.user.email);
          localStorage.setItem("admin", res.data.user.admin);
          // localStorage.setItem("paymentAccount", res.data.user.paymentAccount);
  
        })
        .then(()=>{

          if(localStorage.getItem("admin")==true){
            window.location.href = "/gov";
          }
         else if(localStorage.getItem("admin")==false){
          window.location.href = "/bid";
         }
        })
        .catch((err) => {
          console.log(err);
        });

    };





  return (
    <div>
    <div className='header'>Login</div>
    <div className='login-page'>
   
    
    <input type="text" className='input-field'
     value={username}
     onChange={(e) => {
       setUsername(e.target.value);
     }}
    />
    <br/>

    <input type="password"  className='input-field'
     value={password}
     onChange={(e) => {
       setPassword(e.target.value);
     }}
     />
   
    <button type="submit" onClick={handleSubmit} className='submit-buttons'>LOGIN</button>
    </div>
    </div>
  )
}

export default Login;