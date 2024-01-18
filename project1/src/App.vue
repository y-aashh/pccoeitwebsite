<template>
  <router-view />  
</template>

<style scoped>


</style>


<script>
import Logo0 from "./components/Logo0"
import Logo1 from "./components/Logo1"
import Navbar from "./components/Navbar"
export var obj = {
	token: "",
	name: "",
	ip: "http://localhost:8081"
};

//linear-gradient(to right,#feda75,#fa7e1e,#d62976,#962fbf,#4f5bd5) instagram
//style="background-image: linear-gradient(to top right, #74ebd5, #ACB6E5);"
  export default {
    components:{
      Logo0,
      Logo1,
      Navbar
    }
  }
</script>
