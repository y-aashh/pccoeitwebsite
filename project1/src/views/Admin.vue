<template>
	<div>
		<Navbar />
		<div>
			<div class='wave -one'></div>
    <div class='wave -two'></div>
    <div class='wave -three'></div>

	<div class="wrapper fadeInDown">

		<v-container grid-list-md text-center>
              <v-layout wrap>
                <v-flex xs2>
                  <div style="background-color: transparent">
                  </div>
                </v-flex>
                <v-flex xs8>
                  <v-card
                  class="p-2 text-center"
                  color="rgba(255,255,255, 0)"
                >
				 <b-button @click="onAddFaculty" pill v-bind:variant="addButton" >
                   Add Faculty
                 </b-button>
                  <b-button @click="onRestoreFaculty" pill v-bind:variant="restoreButton" class="ml-5">
                   Restore Faculty
                 </b-button>
                  <b-button @click="onRemoveFaculty" pill v-bind:variant="removeButton" class="ml-5">
				   Remove Faculty
                 </b-button>	
                  </v-card>
                </v-flex>
            </v-layout>
          </v-container>

	<div  v-if="showTable === true" >
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
                    :select-mode="'single'"
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
				<v-flex xs4>
				</v-flex>
				<v-flex xs4 style="margin-left:30px;">
					<b-pagination
                        v-model="currentPage"
                        :total-rows="rows"
                        :per-page="perPage"
                        aria-controls="my-table"
                      ></b-pagination>
				</v-flex>
            </v-layout>
            
          </v-container>

          <b-container border> 
            <b-row>
              <b-col xs-4></b-col>
              <b-col sm></b-col>
              <b-col sm></b-col>
            </b-row>
          </b-container>
	</div>
	<div v-else-if="addfaculty === true">
		<v-card
    class="mx-auto text-center"
    color="rgba(255,255,255, 0.9)"
    max-width="800"
  >
		<v-container>
                  <v-row>
                    <v-col
                      cols="12"
                    >
                      <v-text-field
					  v-model="name"
                        filled
                        outlined
                        label="Faculty Name"
						ref="name"
                      ></v-text-field>
                    </v-col>
                    <v-col
                      cols="12"
                      md="6"
                    >
                      <v-text-field
					  v-model="username"
                        outlined
                        label="Username"
                        mask="date_mask"
						ref="username"
                      ></v-text-field>
                    </v-col>
                    <v-col
                      cols="12"
                      md="6"
                    >
                      <v-text-field
					  v-model="password"
                        outlined
                        label="Password"
						ref="password"
                      ></v-text-field>
                    </v-col>
                  </v-row>
                   <b-button @click="add" variant="outline-success">
                      ADD
                    </b-button>
                </v-container>
		</v-card>
	</div>

	<div v-else class="wrapper fadeInDown">
		<v-card
		v-if = "removeButton === 'dark'"
    class="mx-auto text-center"
    color="rgba(255,255,255, 0.99)"
    max-width="800"
	style="margin-top:200px;"
  >
	<v-form>
		<h3> Are you sure you want to remove {{faculty}} ?</h3>

                <v-container>
                   <b-button @click="back" variant="outline-success">
                      BACK
                    </b-button>
                    <b-button @click="remove" class="ml-5" variant="outline-danger">
                      DELETE
                    </b-button>
                </v-container>
              </v-form>
		</v-card>
		<v-card
		v-else
    class="mx-auto text-center"
    color="rgba(255,255,255, 0.99)"
    max-width="800"
	style="margin-top:200px;"
  >
	<v-form>
		<h3> Are you sure you want to restore ?</h3>

                <v-container>
                   <b-button @click="back" variant="outline-success">
                      BACK
                    </b-button>
                    <b-button @click="restore" class="ml-5" variant="outline-danger">
                      RESTORE
                    </b-button>
                </v-container>
              </v-form>
		</v-card>
		</div>
		</div>
		</div>
	</div>
</template>




<style scoped>
.wrapper {
  padding-top: 10px;
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
  margin-top: 220px;
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

@keyframes drift {
  from { transform: rotate(0deg); }
  from { transform: rotate(360deg); }
}

</style>

<script>
import Navbar from "../components/Navbar";
import axios from 'axios';
import { obj } from '../App.vue';
import { log } from 'util';

export default {
	name:"admin",
	components:{
		Navbar,
	},
	data() {
		return{
		items:[],
		perPage:9,
		currentPage:1,
		showTable:true,
		faculty:"",
		addfaculty:false,
		name:"",
		password:"",
		username:"",
		addButton:"outline-dark",
		removeButton:"dark",
		restoreButton:"outline-dark",
		fields: [
		],

		}
	},
	computed: {
      rows() {
        return this.items.length
      }
	},
	methods:{
		onRowSelected(items){
			if(this.removeButton=='dark')
			{
			this.showTable = false;
			this.faculty = items[0].faculty_name;
			this.delete_id = items[0].unique_id;
			console.log(this.delete_id);
			}
			else{
				this.showTable = false;
				this.restore_id = items[0].b_unique_id;
			}
		},
		remove() {
			// delete faculty `this.delete_id`
			axios
			.post(`${obj.ip}/services/admin/delete`, {
				token: `${obj.token}`,
				id: `${this.delete_id}`
			})
			.then(
				response => {
					//Deleted
					this.items = response.data;
				},
				error => {
					obj.token = "";
					console.log(error);
				}
			);
			this.showTable = true;
			
		},
		back() {
			this.showTable = true;
		},
		onAddFaculty(){
			this.addfaculty = true;
			this.showTable = false;
			this.addButton="dark";
		this.removeButton="outline-dark";
		this.restoreButton="outline-dark";
		},
		onRestoreFaculty(){
			this.addButton="outline-dark";
		this.removeButton="outline-dark";
		this.restoreButton="dark";
this.showTable = true;
			axios
			.post(`${obj.ip}/services/admin/get_deleted`, {
				token: `${obj.token}`
			})
			.then(
				response => {
					// New faculty added			
					this.items = response.data;
					
				},
				error => {
					obj.token = "";
					console.log(error);
				}
			);

	this.fields= [
		{ key: 'b_username', label: 'Username' },
		{ key: 'b_faculty_name', label: 'Faculty Name' },
	];

		},
		onRemoveFaculty(){
			
			this.showTable = true;
			this.addfaculty = false;
			this.addButton="outline-dark";
		this.removeButton="dark";
		this.restoreButton="outline-dark";
			 
			 axios
		.post(`${obj.ip}/services/admin/faculty_names`, {
			token: `${obj.token}`
		})
		.then(
			response => {
				console.log('response');
				this.items = response.data;
			},
			error => {
				obj.token = "";
				console.log(error);
			}
		);
		this.fields = [];
			
		},
		add() {
			// add a new faculty
			console.log(this.$refs.name.value);

			axios
			.post(`${obj.ip}/services/admin/add`, {
				token: `${obj.token}`,
				name: `${this.$refs.name.value}`,
				username: `${this.$refs.username.value}`,
				password: `${this.$refs.password.value}`
			})
			.then(
				response => {
					// New faculty added			
					this.items = response.data;
					alert("Added sucessfully");
				},
				error => {
					obj.token = "";
					console.log(error);
				}
			);
		},
		get_deleted() {
			axios
			.post(`${obj.ip}/services/admin/get_deleted`, {
				token: `${obj.token}`
			})
			.then(
				response => {
					// New faculty added			
					this.items = response.data;
				},
				error => {
					obj.token = "";
					console.log(error);
				}
			);
		},
		restore() {
			// Restore a faculty
			// Give the id of the selected teacher which is to be restored
			console.log("inrestore");
			console.log(this.restore_id);
			alert("SUCCESSFULLY RESTORED")
			axios
			.post(`${obj.ip}/services/admin/restore`, {
				token: `${obj.token}`,
				id: `${this.restore_id}`
			})
			.then(
				response => {
					// New faculty added			
					axios
			.post(`${obj.ip}/services/admin/get_deleted`, {
				token: `${obj.token}`
			})
			.then(
				response => {
					// New faculty added			
					this.items = response.data;
				},
				error => {
					obj.token = "";
					console.log(error);
				}
			);
					
					this.showTable = true;
				},
				error => {
					obj.token = "";
					console.log(error);
				}
			);
		}

	},
	mounted(){
		axios
		.post(`${obj.ip}/services/admin/faculty_names`, {
			token: `${obj.token}`
		})
		.then(
			response => {
				console.log('response');
				this.items = response.data;
			},
			error => {
				obj.token = "";
				console.log(error);
			}
		);
	}
}
</script>