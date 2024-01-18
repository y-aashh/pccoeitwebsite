<template>

  <div>
   
   
    <Navbar /> 
    <div class='wave -one'></div>
    <div class='wave -two'></div>
    <div class='wave -three'></div>
  
      <v-container class="wrapper fadeInDown">
         <!-- > -->

              <v-layout wrap>
                <v-row>
                <v-col :xs="12" :md="6">
                  <v-card
                  class="p-2 text-center"
                  color="rgba(255,255,255, 0)"
                >
                  <b-button @click="onAttended" pill v-bind:variant="att" class="mt-2">
                   ATTENDED
                 </b-button>
                  <b-button @click="onOrganized" pill v-bind:variant="org" class="ml-2 mt-2">
                   ORGANIZED
                 </b-button>
                  </v-card>
                </v-col>
                <v-flex class="ml-2 mt-2" :xs="12" :md="6">  
                  <v-text-field
                      v-model="filter"
                      label="Search"       
                      class="mx-auto"
                      prepend-icon="mdi-account-search"
                    ></v-text-field>
                </v-flex>
                </v-row>
            </v-layout>
          </v-container>

            <v-container>
              <v-layout wrap>
                <v-col :xs="12" :md="12">  
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
                  
                </v-col>
            </v-layout>
            
          </v-container>

          <v-container grid-list-md text-center>
              <v-layout wrap>
                <v-flex xs6 md6>  
                  <b-pagination
                        v-model="currentPage"
                        :total-rows="rows"
                        :per-page="perPage"
                        aria-controls="my-table"
                      ></b-pagination>
                </v-flex>
            </v-layout>
          </v-container>
<v-layout>
    <v-col :xs="4" :md="6" v-if="showModal" >
    <Modal v-if="att === 'dark'" @close="showModal = false" :propObj="selected">
    
    <h3 slot="header">Details</h3>
  </Modal>
  <Modal2 v-else @close="showModal = false" :propObj="selected">
    
    <h3 slot="header">Details</h3>
  </Modal2>
    </v-col>
</v-layout>
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
@keyframes drift {
  from { transform: rotate(0deg); }
  from { transform: rotate(360deg); }
}

</style>


<script>
import Modal from "../components/Modal";
import Modal2 from "../components/Modal2";
import axios from 'axios';
import { obj } from '../App.vue';
import Navbar from "../components/Navbar";

export default {
  name: "advanced",
  components:{
    Modal,
    Navbar,
    Modal2,
  },
  
 data() {
      return {
        perPage: 9,
        currentPage: 1,
        filter: null,
        showModal: false,
        selectMode: 'single',
        selected: Object,
        att: "dark",
        org: "outline-dark",
        /*
        items: [
          {
              name: 'KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum',
              calories: 'KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum',
             fat: 'KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum',
            carbs: 'KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum',
             protein: 'KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum',
             iron: '6%',
        },

          {
              name: 'Frozen Yogurt',
              calories: 159,
              fat: 6.0,
              carbs: 24,
              protein: 4.0,
              iron: '1%',
            },
            {
              name: 'Ice cream sandwich',
              calories: 237,
              fat: 9.0,
              carbs: 37,
              protein: 4.3,
              iron: '1%',
            },
            {
              name: 'Eclair',
              calories: 262,
              fat: 16.0,
              carbs: 23,
              protein: 6.0,
              iron: '7%',
            },
            {
              name: 'Cupcake',
              calories: 305,
              fat: 3.7,
              carbs: 67,
              protein: 4.3,
              iron: '8%',
            },
            {
              name: 'Gingerbread',
              calories: 356,
              fat: 16.0,
              carbs: 49,
              protein: 3.9,
              iron: '16%',
            },
            {
              name: 'Jelly bean',
              calories: 375,
              fat: 0.0,
              carbs: 94,
              protein: 0.0,
              iron: '0%',
            },
            {
              name: 'Lollipop',
              calories: 392,
              fat: 0.2,
              carbs: 98,
              protein: 0,
              iron: '2%',
            },
            {
              name: 'Honeycomb',
              calories: 408,
              fat: 3.2,
              carbs: 87,
              protein: 6.5,
              iron: '45%',
            },
            {
              name: 'Donut',
              calories: 452,
              fat: 25.0,
              carbs: 51,
              protein: 4.9,
              iron: '22%',
            },
            {
              name: 'KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum',
              calories: 'KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum',
             fat: 'KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum',
            carbs: 'KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum',
             protein: 'KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum',
             iron: '6%',
        },
         {
              name: 'KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum',
              calories: 'KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum',
             fat: 'KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum',
            carbs: 'KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum',
             protein: 'KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum KitKat loreumipsum loreumipsum',
             iron: '6%',
        },

          {
              name: 'Frozen Yogurt',
              calories: 159,
              fat: 6.0,
              carbs: 24,
              protein: 4.0,
              iron: '1%',
            },
            {
              name: 'Ice cream sandwich',
              calories: 237,
              fat: 9.0,
              carbs: 37,
              protein: 4.3,
              iron: '1%',
            },
            {
              name: 'Eclair',
              calories: 262,
              fat: 16.0,
              carbs: 23,
              protein: 6.0,
              iron: '7%',
            },
            {
              name: 'Cupcake',
              calories: 305,
              fat: 3.7,
              carbs: 67,
              protein: 4.3,
              iron: '8%',
            },
            {
              name: 'Gingerbread',
              calories: 356,
              fat: 16.0,
              carbs: 49,
              protein: 3.9,
              iron: '16%',
            },
            {
              name: 'Jelly bean',
              calories: 375,
              fat: 0.0,
              carbs: 94,
              protein: 0.0,
              iron: '0%',
            },
        ],*/

        //Default fields 

        fields: [
          { key: 'faculty_name', label: 'Faculty Name' },
          { key: 'workshop_name', label: 'Workshop Name' },

        ],

        
        items:[]
      }
    },
    mounted() {

      //Will hit "attended by" route
      console.log("mounted");
	axios
	.post(`${obj.ip}/services/view/attended`, {
		token:`${obj.token}`
	})
	.then(
		response => {
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
        this.selected = items;
        this.showModal=true;
      },
      onAttended() {
        this.att="dark";
        this.org="outline-dark";


	axios
	.post(`${obj.ip}/services/view/attended`, {
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
		{ key: 'faculty_name', label: 'Faculty Name' },
		{ key: 'workshop_name', label: 'Workshop Name' },
	]   

      },
      onOrganized() {
        this.org="dark";
        this.att="outline-dark";

        //Modify ROUTE to "Organized by" database
		axios
		.post(`${obj.ip}/services/view/organized`, {
			token:`${obj.token}`
		})
		.then(
			response => {
      this.items=response.data;
      console.log(this.items);
			},
			error => {
				alert(error);
				obj.token = "";
				console.log(error);
			}
		);


      //chnage fields and keys as per "organized by" data
       this.fields= [
          { key: 'faculty_name', label: 'Faculty Name' },
          { key: 'workshop_name', label: 'Workshop Name' },
        ] 

      }
    }
};
</script>