<template>
    <div>
      <Navbar/>
      <div class='wave -one'></div>
      <div class='wave -two'></div>
      <div class='wave -three'></div>
      <div class="wrapper fadeInDown" style="margin-top: 100px">
        <div id="formContent">
            <!-- Tabs Titles -->

            <!-- Icon -->
            <div v-if="faculty"  class="fadeIn first " style="font-family: 'Playfair Display', serif; text-indent: .3em; font-size: 30px; margin:10px; ">
              Faculty Login
            </div>

            <div v-else class="fadeIn first " style="font-family: 'Playfair Display', serif; text-indent: .3em; font-size: 30px; margin:10px;">
              Admin Login
            </div>
            <!-- Login Form -->
            <form>
            <input type="text" ref="login" class="fadeIn second" name="login" placeholder="Login">
            <input type="password" ref="password" class="fadeIn third" name="login" placeholder="Password" v-on:keyup.enter="send">
            <input class="fadeIn fourth submit" value="Log In" @click.stop="send()" method="post">
            </form>

            <!-- Remind Passowrd -->
            <div id="formFooter">
            <a v-if="faculty" class="underlineHover" href="#" @click.stop="goAdmin()">Admin Login</a>
            <a v-else class="underlineHover" href="#" @click.stop="goFaculty()">Faculty Login</a>
            </div>

        </div>
    </div>
   </div> 
</template>

<style scoped>
.wrapper {
  display: flex;
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 103%;
  min-height: 150%;
  padding: 20px;
}

#formContent {
  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background: #fff;
  padding: 30px;
  width: 90%;
  max-width: 450px;
  position: relative;
  padding: 0px;
  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  text-align: center;
}

#formFooter {
  background-color: #f6f6f6;
  border-top: 1px solid #dce8f1;
  padding: 25px;
  text-align: center;
  -webkit-border-radius: 0 0 10px 10px;
  border-radius: 0 0 10px 10px;
}
.title {
  left: 0;
  top: 0;
  width: 100%;
  text-align: center;

  font-family: 'Playfair Display', serif;
  line-height: 0;
  
  text-shadow: 0 1px 0 rgba(black, .1);
  text-indent: .3em;
}

.submit{
  background-color: #56baed;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}


input[type=text] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

input[type=text]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=text]:placeholder {
  color: #cccccc;
}

input[type=password] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

input[type=password]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=password]:placeholder {
  color: #cccccc;
}


/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}

.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}

.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}

.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
  display: block;
  left: 0;
  bottom: -10px;
  width: 0;
  height: 2px;
  background-color: #56baed;
  content: "";
  transition: width 0.2s;
}

.underlineHover:hover {
  color: #0d0d0d;
}

.underlineHover:hover:after{
  width: 100%;
}




.wave {
  opacity: .6;
  position: absolute;
  top: 3%;
  left: 50%;
  background: #0af;
  width: 550px;
  height: 550px;
  margin-left: -250px;
  margin-top: 210px;
  transform-origin: 50% 48%;
  border-radius: 76%;
  animation: drift 3000ms infinite linear;
}

.wave.-three {
  animation: drift 5000ms infinite linear;
  opacity: .4;
  background: #0af;
}

.wave.-two {
  animation: drift 7000ms infinite linear;
  opacity: .4;
  background: yellow;
}
@keyframes drift {
  from { transform: rotate(0deg); }
  from { transform: rotate(360deg); }
}

</style>

<script>
import Vue from 'vue';
import axios from 'axios';
import { log } from 'util';
import { obj } from '../App.vue';
import Navbar from "../components/Navbar";

export default {
    name:"login",
    components:{
      Navbar,
    },
	data: () =>({
  login:"",
  faculty:true,
	}),
	methods:{
		send() {
      console.log('HIT post method');
      if(this.faculty){
        //facculty login route hit
			axios
				.post(`${obj.ip}/services/login/teacher`, {
				userid: `${this.$refs.login.value}`,
				password: `${this.$refs.password.value}`
			})
			.then(
				response => {
          obj.token = response.data.token;
          obj.name = response.data.name;
					this.$router.replace({ name: "advanced" });
				},
				error => {
					alert(error);
					obj.token = "";
					console.log(error);
				}
      );
      }
      else{
        //admin login route hit
		axios
		.post(`${obj.ip}/services/login/admin`, {
			userid: `${this.$refs.login.value}`,
			password: `${this.$refs.password.value}`
		})
		.then(
			response => {
				obj.token = response.data.token;
				obj.name = response.data.name;
				this.$router.replace({ name: "admin" });
			},
			error => {
				alert(error);
				obj.token = "";
				console.log(error);
			}
		);
      }
    },
    goFaculty(){
      this.faculty=true;
    },
    goAdmin(){
      this.faculty=false;
    }
	}
};
</script>
