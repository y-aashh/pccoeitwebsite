<template>
<div>
  <Navbar/>
    <div class='wave1 -one'></div>
    <div class='wave1 -two'></div>
    <div class='wave1 -three'></div>
 <div class="wrapper fadeInDown" >
  
   <v-container grid-list-md text-center>
              <v-layout wrap>
                <v-flex xs4>
                  <div style="background-color: transparent">
                  </div>
                </v-flex>
                <v-flex xs4>
                  <v-card
                  class="p-2 text-center"
                  color="rgba(255,255,255, 0)"
                >
                  <b-button @click="onAttended" pill v-bind:variant="att">
                   ATTENDED
                 </b-button>
                  <b-button @click="onOrganized" pill v-bind:variant="org" class="ml-2">
                   ORGANIZED
                 </b-button>
                  </v-card>
                </v-flex>
            </v-layout>
          </v-container>
      <v-card
      v-if="att=='dark'"
    class="mx-auto text-center"
    color="rgba(255,255,255, 0.9)"
    max-width="800"
  >
    <v-form>
                <v-container>
                  <v-row>
                    <v-col
                      cols="12"
                    >
                      <v-text-field
                        v-model="t_w_name"
                        filled
                        outlined
                        label="Workshop Name"
						          ref="workshop_name"
                      ></v-text-field>
                    </v-col>
                    <v-col
                      cols="12"
                      md="6"
                    >
                      <v-text-field
                        v-model="t_date"
                        outlined
                        label="Date YYYY-MM-DD"
                        mask="date_mask"
						            ref="start_date"
                      ></v-text-field>
                    </v-col>
                    <v-col
                      cols="12"
                      md="6"
                    >
                      <v-text-field
                        v-model="t_interaction_type"
                        filled
                        outlined
                        label="Interaction Type"
						ref="i_type"
                      ></v-text-field>
                    </v-col>

                    <v-col
                      cols="12"
                      md="6"
                    >
                      <v-text-field
                        v-model="t_duration"
                        filled
                        outlined
                        label="Duration (In Days)"
						ref="duration"
                      ></v-text-field>
                    </v-col>
                    <v-col
                      cols="12"
                      md="6"
                    >
                      <v-text-field
                        v-model="t_organized_by"
                        filled
                        outlined
                        label="Organized By"
						ref="organized_by"
                      ></v-text-field>
                    </v-col>

                    
                  </v-row>
                   <b-button @click="ok" variant="outline-success">
                      OK
                    </b-button>
                </v-container>
              </v-form>
   
  </v-card>

  <v-card
    v-else
    class="mx-auto text-center"
    color="rgba(255,255,255, 0.9)"
    max-width="800"
  >
    <v-form>
                <v-container>
                  <v-row>
                    <v-col
                      cols="12"
                    >
                      <v-text-field
                        v-model="t_org_w_name"
                        filled
                        outlined
                        label="Workshop Name"
						ref="organized_workshop_name"

                      ></v-text-field>
                    </v-col>
                    <v-col
                      cols="12"
                      md="6"
                    >
                      <v-text-field
                        v-model="t_org_date"
                        filled
                        outlined
                        label="Date YYYY-MM-DD"
						ref="organized_workshop_date"

                      ></v-text-field>
                    </v-col>     
                    <v-col
                      cols="12"
                      md="6"
                    >
                      <v-text-field
                        v-model="t_org_venue"
                        filled
                        outlined
                        label="Venue"
						ref="organized_venue"

                      ></v-text-field>
                    </v-col>                
                  </v-row>
                   <b-button @click="ok1" variant="outline-success">
                      OK
                    </b-button>
                </v-container>
              </v-form>
   
  </v-card>


  
    
    </div>
<Modal1 v-if="showModal" @close="showModal = false">
    <!--
      you can use custom content here to overwrite
      default content
    -->
    <h3 slot="container">{{status}}</h3>
  </Modal1>

</div>
</template>

<style scoped>
.wrapper {
  padding-top: 20px;
  padding-left: 50px;
  padding-right: 50px;
}
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
.wave1 {
  opacity: .6;
  position: absolute;
  top: 3%;
  left: 50%;
  background: #0af;
  width: 650px;
  height: 650px;
  margin-left: -330px;
  margin-top: 240px;
  transform-origin: 50% 48%;
  border-radius: 76%;
  animation: drift 4000ms infinite linear;
}

.wave1.-three {
  animation: drift 5000ms infinite linear;
  opacity: .4;
  background: #0af;
}

.wave1.-two {
  animation: drift 6000ms infinite linear;
  opacity: .4;
  background: yellow;
}
@keyframes drift {
  from { transform: rotate(0deg); }
  from { transform: rotate(360deg); }
}

</style>

<script>
import Modal1 from "../components/Modal1";
import Navbar from "../components/Navbar";
import axios from 'axios';
import { obj } from '../App.vue';
import { mask } from 'vue-the-mask'


  export default {
       name: "add",
       components: {
        Modal1,
        Navbar,
       
       },
    data: () => ({
        t_w_name:"",
        t_date:"",
        t_duration:"",
        t_organized_by:"",
        t_interaction_type:"",
        t_org_w_name:'',
        t_org_venue:"",
        t_org_date:"",
        date_mask:'####-##-##',
        showModal:false,
        status:"i dont know",
        att: "dark",
        org: "outline-dark",
      
    }),
    mounted() {
        window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
    },
    methods:{
        ok() {
            console.log(this.t_organized_by);
            console.log(this.t_w_name);

			let pattern = /^([A-Za-z0-9 ()]{1,100})$/
			let error = pattern.test(this.t_w_name);
			if(!error) {
				console.log('Inside if');
				alert('Enter Valid Workshop Name');
				return;
			} else {
				console.log('Inside else');
				console.log(this.t_interaction_type);
				error = pattern.test(this.t_interaction_type);
				if(!error) {
					alert('Enter Valid Interaction Type');
					return;
				} else {
					error = pattern.test(this.t_organized_by);
					if(!error) {
						alert('Enter Valid Organized By');
						return;
					} else {
						let duration_pattern = /^[0-9]{1,7}$/
						error = duration_pattern.test(this.t_duration);
						if(!error) {
							alert('Enter Valid Duration');
							return;
						} else {
							let date_pattern = /^[0-9]{4}[-][0-9]{2}[-][0-9]{2}$/
							error = date_pattern.test(this.t_date);
							if(!error) {
								alert('Enter Valid Date');
								return;
							} else {
								axios
								.post(`${obj.ip}/services/add/attended`, {
									token: `${obj.token}`,
									workshop_name: `${this.$refs.workshop_name.value}`,
									start_date: `${this.$refs.start_date.value}`,
									interaction_type: `${this.$refs.i_type.value}`,
									duration: `${this.$refs.duration.value}`,
									organized_by: `${this.$refs.organized_by.value}`
								})
								.then(
									response => {
										console.log('response');
										this.status = "SUCCESS";
									},
									error => {
										this.status = "ERROR TRY AGAIN";
										obj.token = "";
										console.log(error);
									}
								);
							}
						}
					}
				}
			}
			
            //postmethod for INSERT QUERY
            // ON INSERT SUCCESS CHANGE this.status to "SUCCESS"
            //on error this.status to "ERROR TRY AGAIN"
          /*axios
          .post(`${obj.ip}/services/add/attended`, {
            token: `${obj.token}`,
            workshop_name: `${this.$refs.workshop_name.value}`,
            start_date: `${this.$refs.start_date.value}`,
            interaction_type: `${this.$refs.i_type.value}`,
            duration: `${this.$refs.duration.value}`,
            organized_by: `${this.$refs.organized_by.value}`
          })
          .then(
            response => {
              console.log('response');
              this.status = "SUCCESS";
            },
            error => {
              this.status = "ERROR TRY AGAIN";
              obj.token = "";
              console.log(error);
            }
          );*/

        this.showModal=true;
        this.t_w_name="";
        this.t_date="";
        this.t_duration="";
        this.t_organized_by="";
        this.t_interaction_type="";
        },
        ok1() {
		console.log(this.t_org_w_name);
        console.log(this.t_org_venue);
        console.log(this.t_org_date);
		let pattern = /^([A-Za-z0-9 ()]{1,100})$/
		let error = pattern.test(this.t_org_w_name);
		if(!error) {
			alert('Enter Valid Workshop Name');
			return;
		} else {
			error = pattern.test(this.t_org_venue);
			if(!error) {
				alert('Enter Valid Venue');
				return;
			} else {
				let date_pattern = /^[0-9]{4}[-][0-9]{2}[-][0-9]{2}$/
				error = date_pattern.test(this.t_org_date);
				if(!error) {
					alert('Enter Valid Date');
					return;
				} else {
					axios
					.post(`${obj.ip}/services/add/organized`, {
						token: `${obj.token}`,
						workshop_name: `${this.t_org_w_name}`,
						date: `${this.t_org_date}`,
						venue: `${this.t_org_venue}`
					})
					.then(
						response => {
							console.log('response');
							this.status = "SUCCESS";
						},
						error => {
							this.status = "ERROR TRY AGAIN";
							obj.token = "";
							console.log(error);
						}
					);
				}
			}
		}
		/*axios
          .post(`${obj.ip}/services/add/organized`, {
            token: `${obj.token}`,
			workshop_name: `${this.$refs.organized_workshop_name.value}`,
			date: `${this.$refs.organized_workshop_date.value}`,
			venue: `${this.$refs.organized_venue.value}`
          })
          .then(
            response => {
              console.log('response');
              this.status = "SUCCESS";
            },
            error => {
              this.status = "ERROR TRY AGAIN";
              obj.token = "";
              console.log(error);
            }
          );*/
		  this.showModal=true;
          this.t_org_w_name="";
          this.t_org_venue="";
          this.t_org_date="";

        },
        
        onAttended() {
        this.att="dark";
        this.org="outline-dark";

      },

      onOrganized() {
        this.org="dark";
        this.att="outline-dark";
        
    }
    }
  }
</script>