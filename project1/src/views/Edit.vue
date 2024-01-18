<template>
<div>
  <Navbar/>
  <div style="padding-top: 5px">

   
   <div v-if="display===true">
    <div class='wave -one'></div>
    <div class='wave -two'></div>
    <div class='wave -three'></div>
   </div>

   <div v-else>
    <div class='wave1 -one'></div>
    <div class='wave1 -two'></div>
    <div class='wave1 -three'></div>
   </div>
    
    <div v-if="display===true" class="wrapper fadeInDown" >
     

     <v-container grid-list-md text-center>
              <v-layout wrap>
                <v-flex xs2>
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
                <v-flex class="ml-2" xs4>  
                  <v-text-field
                      v-model="filter"
                      label="Search"       
                      class="mx-auto"
                      prepend-icon="mdi-account-search"
                    ></v-text-field>
                </v-flex>
            </v-layout>
          </v-container>

            <v-container grid-list-md text-center>
              <v-layout wrap>
                <v-flex xs12>  
                  <b-table
                    id="my-table"
                    selectable
                    :items="items"
                    :fields="fields"
                    :per-page="perPage"
                    :current-page="currentPage"
                    :filter="filter"
                    :select-mode="selectMode"
                    @filtered="onFiltered"
                    @row-selected="onRowSelected"
                    responsive="sm"
                    large
                    light
                    hover
                    borderless
                    style="background-color: white; padding: 5;"
                  >
                  
                  </b-table>
                  
                </v-flex>
            </v-layout>
            
          </v-container>

          <b-container border> 
            <b-row>
              <b-col xs-4></b-col>
              <b-col sm><b-pagination
                        v-model="currentPage"
                        :total-rows="rows"
                        :per-page="perPage"
                        aria-controls="my-table"
                      ></b-pagination></b-col>
              <b-col sm></b-col>
            </b-row>
          </b-container>
    </div> 
    <div v-else-if="att==='dark'" class="wrapper fadeInDown" >
  
      <v-card
    class="mx-auto text-center"
    color="rgba(255,255,255, 0.99)"
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
						ref="w_name"
                      ></v-text-field>
                    </v-col>
                    <v-col
                      cols="12"
                      md="6"
                    >
                      <v-text-field
                        v-model="t_date"
                        filled
                        outlined
                        label="Date"
						ref="date"
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
                        label="Duration"
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
						ref="o_by"
                      ></v-text-field>
                    </v-col>

                    
                  </v-row>
                   <b-button @click="ok" variant="outline-success">
                      OK
                    </b-button>
                    <b-button @click="remove" class="ml-5" variant="outline-danger">
                      DELETE
                    </b-button>
                </v-container>
              </v-form>
   
  </v-card>
  
    
    </div>


    <!-- DIV FOR ORGANIZED BY -->


    <div v-else class="wrapper fadeInDown" >

<v-card
    class="mx-auto text-center"
    color="rgba(255,255,255, 0.99)"
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
                        label="Organized Workshop Name"
						ref="organized_w_name"
                      ></v-text-field>
                    </v-col>
                    <v-col
                      cols="12"
                      md="6"
                    >
                      <v-text-field
                        v-model="t_org_year"
                        filled
                        outlined
                        label="Date"
						ref="organized_date"
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
                        label="Organized venue"
						ref="venue"
                      ></v-text-field>
                    </v-col>                    
                  </v-row>
                   <b-button @click="ok1" variant="outline-success">
                      OK
                    </b-button>
                    <b-button @click="remove1" class="ml-5" variant="outline-danger">
                      DELETE
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
</div>
</template>

<style scoped>

.title {
  left: 0;
  top: 0;
  width: 50%;
  text-align: left;
  text-shadow: 0 1px 0 rgba(black, .1);
  text-indent: .3em;
}
.wrapper {
  padding-top: 50px;
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

  -webkit-animation-duration:0.5s;
  -moz-animation-duration:0.5s;
  animation-duration:0.5s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.1s;
  -moz-animation-delay: 0.1s;
  animation-delay: 0.1s;
}

/*CIRCLE*/


.wave {
  opacity: .6;
  position: absolute;
  top: 3%;
  left: 50%;
  background: #0af;
  width: 1050px;
  height: 1050px;
  margin-left: -530px;
  margin-top: 250px;
  transform-origin: 50% 48%;
  border-radius: 76%;
  animation: drift 4000ms infinite linear;
}

.wave.-three {
  animation: drift 5000ms infinite linear;
  opacity: .4;
  background: #0af;
}

.wave.-two {
  animation: drift 6000ms infinite linear;
  opacity: .4;
  background: yellow;
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
import axios from 'axios';
import { obj } from '../App.vue';
import Modal1 from "../components/Modal1";
import Navbar from "../components/Navbar";

export default {
  name: "edit",
  attended_selected_id: "",
  organized_selected_id: "",
  components:{
    Modal1,
    Navbar,
  },
  
 data() {
      return {
        display:true,
        perPage: 5,
        currentPage: 1,
        filter: null,
        selectMode: 'single',
        selected: Object,
        t_w_name:"",
        t_date:"",
        t_duration:"",
        t_organized_by:"",
        t_interaction_type:"",


//ORGANIZED BY TEMP VARS
        t_org_w_name:"",
        t_org_venue:"",
        t_org_year:"",



        showModal:false,
        status:"",
        fields: [
          { key: 'workshop_name', label: 'Workshop Name' },
          { key: 'interaction_type', label: 'Interaction Type' },
          { key: 'duration', label: 'Duration(Days)' },
          { key: 'start_date', label: 'Date' },
          { key: 'organized_by', label: 'Organized By' },

        ],
        items:[],
        att: "dark",
        org: "outline-dark",
      }
    },
    mounted() {

            //Edit "view" route to faculty speific
        console.log("mounted");
	axios
	.post(`${obj.ip}/services/edit/attended`, {
		token: `${obj.token}`
	})
	.then(
		response => {
			console.log('response');
			this.items=response.data;
		},
		error => {
			alert(error);
			obj.token = "";
			console.log(error);
		}
	);
  },
    computed: {
      rows() {
        return this.items.length
      }
    },



     methods: {
      onFiltered(filteredItems) {
        // Trigger pagination to update the number of buttons/pages due to filtering
        this.totalRows = filteredItems.length
        this.currentPage = 1
      },
      onRowSelected(items) {
        if(this.att == "dark"){
        
        this.selected = items;
        this.t_interaction_type = this.selected[0].interaction_type;
        this.t_w_name = this.selected[0].workshop_name;
        this.t_date = this.selected[0].start_date;
        this.t_duration = this.selected[0].duration;
        this.t_organized_by = this.selected[0].organized_by;
        this.attended_selected_id = this.selected[0].workshop_id;
        }

        else{
        this.selected = items;
        this.t_org_w_name = this.selected[0].workshop_name;
        this.t_org_venue = this.selected[0].venue;
        this.t_org_year = this.selected[0].year_conducted;
		this.organized_selected_id = this.selected[0].workshop_id;
        }
        window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
        this.display = false;

      },
      ok() {
	axios
	.post(`${obj.ip}/services/edit/attended_update`, {
		token: `${obj.token}`,
		workshop_name: `${this.$refs.w_name.value}`,
		start_date: `${this.$refs.date.value}`,
		interaction_type: `${this.$refs.i_type.value}`,
		duration: `${this.$refs.duration.value}`,
		organized_by: `${this.$refs.o_by.value}`,
		workshop_id: `${this.attended_selected_id}`
	})
	.then(
		response => {
		this.items=response.data;
		this.status="SUCCESSFULLY UPDATED";
		this.showModal=true;
		},
		error => {
			this.status="FAILED";
			this.showModal=true;
			obj.token = "";
		}
	);
	this.display = true;
      },
      remove() {
        this.status="DELETED";
        this.showModal=true;
        this.display = true;


        //Post request to delete workshop based on id this.selected_id
        // delete ATTENDED
		axios
		.post(`${obj.ip}/services/edit/attended_delete`, {
			token: `${obj.token}`,
			workshop_id: `${this.attended_selected_id}`
		})
		.then(
			response => {
			this.items=response.data;
			this.status="SUCCESSFULLY DELETED";
			this.showModal=true;
			this.display=true;
			},
			error => {
				this.status="FAILED";
				this.showModal=true;
				obj.token = "";
			}
		);

       
      },
      onAttended() {
        this.att="dark";
        this.org="outline-dark";
		
		axios
		.post(`${obj.ip}/services/edit/attended`, {
			token: `${obj.token}`
		})
		.then(
			response => {
				console.log('response');
				this.items=response.data;
			},
			error => {
				alert(error);
				obj.token = "";
				console.log(error);
			}
		);

		this.fields= [
          { key: 'workshop_name', label: 'Workshop Name' },
          { key: 'interaction_type', label: 'Interaction Type' },
          { key: 'duration', label: 'Duration(Days)' },
          { key: 'start_date', label: 'Date' },
          { key: 'organized_by', label: 'Organized By' },

        ]

        },



    onOrganized() {
        this.org="dark";
        this.att="outline-dark";

        //FETCH organized by axios post to /edit/organized
        axios
		.post(`${obj.ip}/services/edit/organized`, {
			token: `${obj.token}`
		})
		.then(
			response => {
				console.log('response');
				this.items=response.data;
			},
			error => {
				alert(error);
				obj.token = "";
				console.log(error);
			}
		);



//EDIT IF NECESSARY as per data recieved
		this.fields= [
          { key: 'workshop_name', label: 'Workshop Name' },
          { key: 'venue', label: 'Venue' },
          { key: 'year_conducted', label: 'YEAR' },

        ]
        },
        ok1() {
          //will edit ORGANIZED data
          this.display = true;

		axios
		.post(`${obj.ip}/services/edit/organized_update`, {
			token: `${obj.token}`,
			id: `${this.organized_selected_id}`,
			name: `${this.$refs.organized_w_name.value}`,
			date: `${this.$refs.organized_date.value}`,
			venue: `${this.$refs.venue.value}`
		})
		.then(
			response => {
				console.log('response');
				this.items=response.data;
				this.status="SUCCESSFULLY UPDATED";
				this.showModal=true;
			},
			error => {
				this.status="FAILED";
				this.showModal=true;
				obj.token = "";
				console.log(error);
			}
		);
        },

        remove1() {
          //will delete ORGANIZED data
		axios
		.post(`${obj.ip}/services/edit/organized_delete`, {
			token: `${obj.token}`,
			id: `${this.organized_selected_id}`
		})
		.then(
			response => {
				console.log('response');
				this.items=response.data;
				this.status="SUCCESSFULLY DELETED";
				this.showModal=true;
			},
			error => {
				this.status="FAILED";
				this.showModal=true;
				obj.token = "";
				console.log(error);
				
			}
		);
          this.display = true;
        },

      
    }
};
</script>