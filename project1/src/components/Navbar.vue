<template>

  <div class="img-banner img" :style="{'background-image': 'url(' + require('../assets/nav.png') + ')'}"> 
        <div class="title" style="background-color: transparent;">
          <b-row style="width: 100%;">
              <b-col cols="12">
                <b-navbar  >
                  <Logo0/>
                  <b-navbar-brand class="ml-auto grad-text" style="font-family: 'Playfair Display', serif; text-indent: .3em; letter-spacing: .4em;"><h1 style="font-size: 58px">Faculty Interaction</h1></b-navbar-brand>
                  <span class="ml-auto">
                  <Logo1 />
                  </span>
                </b-navbar> 
              </b-col> 
           </b-row>   
           <span v-if="this.$route.path === '/login' || this.$route.path == '/'">
           <b-row style="width: 100%;">
              <b-col cols=1></b-col>
              <b-col class="border-bottom border-dark" cols=10>
                <span class="h5 pl-2 grad-text" style="font-weight: bold;">
                   
                  </span>
              </b-col> 
              <b-col cols=1></b-col>
            </b-row>  
            </span>
            <span v-else-if="this.$route.path === '/admin'">
              <b-navbar > 
                    <b-navbar-nav class="ml-auto" style="margin-right:120px;">  
                      <b-nav-item-dropdown
                        id="my-nav-dropdown"
                        v-bind:text="user"
                        toggle-class="nav-link-custom"
                        class="h5"
                      >
                      <b-dropdown-item @click="sign" href="#/login">Sign Out</b-dropdown-item>
                      </b-nav-item-dropdown>
                    </b-navbar-nav>
                  </b-navbar> 
            </span>
            <span v-else>
            <b-row style="width: 100%;">
              <b-col cols=1></b-col>
              <b-col class="border-bottom border-dark" style="margin-left:30px;" cols=10>
                  <b-navbar >
                    <b-navbar-nav class="ml-auto" style="letter-spacing: .2em; font-size: 30px;">
                      <b-button @click="add" pill  class="mr-2" v-bind:variant="vadd" size="lg">Add</b-button>
                      <b-button @click="edit" pill class="mr-2" v-bind:variant="vedit" size="lg">Edit</b-button>
                      <b-button @click="find" pill class="mr-2" v-bind:variant="vfind" size="lg">Report</b-button>
                      <b-button @click="advanced" pill class="mr-2" v-bind:variant="vadvanced" size="lg">Search</b-button>
                      <b-button  @click="report" pill v-bind:variant="vreport" size="lg">Analysis</b-button>


                      <!-- <b-nav-item href="#/add" class="h5 pr-2 grad-text" >Add</b-nav-item>
                      <b-nav-item href="#/find" class="h5 pr-2 grad-text" >Find</b-nav-item>
                      <b-nav-item href="#/edit" class="h5 pl-2 pr-2 grad-text" >Edit</b-nav-item>
                      <b-nav-item href="#/advanced" class="h5 pl-2 grad-text" style="font-weight: bold;">Search</b-nav-item>
                      <b-nav-item href="#/report" class="h5 pl-2 grad-text" style="font-weight: bold;">Report</b-nav-item> -->
                    </b-navbar-nav>  
                    <b-navbar-nav class="ml-auto">  
                      <b-nav-item-dropdown
                        id="my-nav-dropdown"
                        v-bind:text="user"
                        toggle-class="nav-link-custom"
                        class="h5"
                      >
                      <b-dropdown-item @click="sign" href="#/login">Sign Out</b-dropdown-item>
                      </b-nav-item-dropdown>
                    </b-navbar-nav>
                  </b-navbar> 
              </b-col> 
            </b-row> 
            </span>
        </div>
      </div>
     

  </template>
<style scoped>
.img{
    background-size: cover;
    background-repeat: no-repeat;
}
.grad-text{ 
  font-weight: bold;
  background: linear-gradient(to right,#000); 
  -webkit-background-clip: text; 
  -webkit-text-fill-color: transparent;
}
.grad-text1{ 
  font-size: 5cm;
  background: linear-gradient(to right,#000); 
  -webkit-background-clip: text; 
  -webkit-text-fill-color: transparent;
}
.box {
  width: 100%;
  height: 600px;
  border-radius: 5px;
  box-shadow: 0 2px 30px rgba(black, .2);
  position: relative;
  overflow: hidden;
  transform: translate3d(0, 0, 0);
}
.title {
  position: relative;
  left: 0;
  top: 0;
  width: 100%;
  z-index: 1;
  text-align: center;
  transform: translate3d(0, 0, 0);
  line-height: 0;
  
  text-shadow: 0 1px 0 rgba(black, .1);
  text-indent: .3em;
}
@keyframes drift {
  from { transform: rotate(0deg); }
  from { transform: rotate(360deg); }
}

</style>
<script>
import Logo0 from "./Logo0"
import Logo1 from "./Logo1"
import { obj } from "../App"
//linear-gradient(to right,#feda75,#fa7e1e,#d62976,#962fbf,#4f5bd5) instagram
//style="background-image: linear-gradient(to top right, #74ebd5, #ACB6E5);"
  export default {
      name:"navbar",
    components:{
      Logo0,
      Logo1
    },
    data() {
      return{
        Find:"",
        Edit:"",
        Search:"",
        user:"",
        vadd:"outline-dark",
        vedit:"outline-dark",
        vfind:"outline-dark",
        vreport:"outline-dark",
        vadvanced:"outline-dark",
      }
    },
    mounted() {
      this.user=obj.name;
      console.log(this.$route.path);
      if(this.$route.path == "/add"){
        this.vadd="dark";
        this.vedit = this.vfind = this.vreport = this.vadvanced = "outline-dark";
      }
      if(this.$route.path == "/edit"){
        this.vedit ="dark";
        this.vadd= this.vfind = this.vreport = this.vadvanced = "outline-dark";
      }
      if(this.$route.path == "/find"){
        this.vfind ="dark";
        this.vadd=this.vedit =  this.vreport = this.vadvanced = "outline-dark";
      }
      if(this.$route.path == "/report"){
        this.vreport = "dark";
        this.vadd=this.vedit = this.vfind =  this.vadvanced = "outline-dark";
      }
      if(this.$route.path == "/advanced"){
         this.vadvanced = "dark";
        this.vadd=this.vedit = this.vfind = this.vreport = "outline-dark";
      }
    },
    methods:{
      add(){
        this.$router.replace({ name: "add" });
      },
      edit(){
        this.$router.replace({ name: "edit" });
      },
      find(){
        
        this.$router.replace({ name: "find" });
      },
      report(){
        this.$router.replace({ name: "report" });
      },
      advanced(){
        this.$router.replace({ name: "advanced" });
      },
	  sign(){
		obj.token="";
	  }
    }
  }
  
</script>