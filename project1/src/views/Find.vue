<template>
<div> 
  <Navbar/>
<div style="margin-top 50px">
 
<div class='wave -one'></div>
    <div class='wave -two'></div>
    <div class='wave -three'></div>
<v-container v-if="showTable===true" grid-list-md text-center>
              <v-layout wrap>
                <v-row>
                   
                </v-row>
                <v-row style="margin-top:20px; margin-left:7px;">

                  <v-card
                  class="p-2 text-center"
                  color="rgba(255,255,255, 0)"
                >   
                  <b-button pill @click="generate" variant="dark" size="lg">Generate Report</b-button> 
                  </v-card>
                </v-row> 
                <v-row>
                <v-flex xs12>
                  
                  <v-card
                  class="p-2 text-center"
                  color="rgba(255,255,255, 0.9)"
                >   
                <b-button pill v-bind:variant="teacher" @click="selectAllTeach" style="margin-bottom:15px;">
                    {{butTeach}} All Faculties
                  </b-button>
                <b-form-group>
      <b-form-checkbox-group
      
        v-model="selectedFaculties"
        :options="faculties"
       
      ></b-form-checkbox-group>
    </b-form-group>

                  </v-card>
                </v-flex>
                </v-row>
                <v-row style="margin-top:10px;">
                  <v-flex xs6 >
                  
                  <v-card
                  class="p-2 text-center"
                  color="rgba(255,255,255, 0.9)"
                >   
                <b-button pill v-bind:variant="year" @click="selectAllYears" style="margin-bottom:15px;">
                    {{butYears}} All Years
                  </b-button>
                <b-form-group>
      <b-form-checkbox-group

        v-model="selectedYears"
        :options="years"
       
      ></b-form-checkbox-group>
    </b-form-group>

                  </v-card>
                </v-flex>


                <v-flex xs6>
                 
                  <v-card
                  class="p-2 text-center"
                  color="rgba(255,255,255, 0.9)"
                >   
                 <b-button pill v-bind:variant="semester" @click="selectAllSems" style="margin-bottom:15px;">
                    {{butSems}} All Semesters
                  </b-button>
                <b-form-group>
      <b-form-checkbox-group
     
        v-model="selectedSemesters"
        :options="semesters"
       
      ></b-form-checkbox-group>
    </b-form-group>

                  </v-card>
                </v-flex>
                </v-row>

            </v-layout>
          </v-container>


          <v-container v-else grid-list-md text-center class="wrapper fadeInDown" style="margin-top:30px;">

              <v-layout wrap>


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
                  <b-button @click="print" size="lg" pill variant="dark">
                   PRINT
                 </b-button>
                  <b-button @click="ok" pill size="lg" variant="dark" class="ml-2">
                   OK
                 </b-button>
                  </v-card>
                </v-flex>
            </v-layout>

                <v-flex xs12>  
                  <b-table
                    id="my-table"
                    :items="items"
                    :per-page="perPage"
                    :current-page="currentPage"
                    responsive="sm"
                    large
                    light
                    hover
                    borderless
                    style="background-color: white; padding: 5;"
                  >
                  
                  </b-table>
                  
                </v-flex>
                <v-flex xs6>  
                  <b-pagination
                        v-model="currentPage"
                        :total-rows="rows"
                        :per-page="perPage"
                        aria-controls="my-table"
                      ></b-pagination>
                </v-flex>
            </v-layout>
            
          </v-container>
 
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
  width: 800px;
  height: 800px;
  margin-left: -400px;
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
import Navbar from "../components/Navbar";
import axios from 'axios';
import { obj } from '../App.vue';
  export default {
    components:{
      Navbar
      },
    data: () => ({
 perPage: 5,
        currentPage: 1,
items: [
        ],
      showTable:true,
      faculties:[],
      years: [],
      semesters: [1,2],
      selectedFaculties:[],
      selectedYears: [],
      selectedSemesters: [],
      
      teacher:"outline-dark",
      year:"outline-dark",
      semester:"outline-dark",

      selectedAllTeach:false,
      selectedAllYears:false,
      selectedAllSems:false,

      butTeach:"Check",
      butYears:"Check",
      butSems:"Check"
    }),
     computed: {
      rows() {
        return this.items.length
      }
    },
    mounted(){
      axios.post(`${obj.ip}/services/find/get_data`, {
	token: `${obj.token}`
  })
.then(
	response => {
    console.log('response');
    this.faculties = response.data.faculty_name;
    this.years = response.data.year;
	},
	error => {
		obj.token = "";
		console.log(error);
	}
  );

    },
    methods:{
      ok(){
        this.showTable=true;
        this.items = [];
      },
      selectAllTeach() {
        if(this.selectedAllTeach==false){
         this.selectedAllTeach=true;
         this.butTeach="Un-Check";
         this.teacher="dark"; 
        this.selectedFaculties = this.faculties;
        }
        else{
          this.selectedAllTeach=false;
          this.butTeach="Check";
          this.teacher="outline-dark";
          this.selectedFaculties=[];
        }
      },
      selectAllYears() {
        if(this.selectedAllYears==false){
         this.selectedAllYears=true;
         this.butYears="Un-Check";
         this.year="dark"; 
        this.selectedYears = this.years;
        }
        else{
          this.selectedAllYears=false;
          this.butYears="Check";
          this.year="outline-dark";
          this.selectedYears=[];
        }
      },
      selectAllSems() {
        if(this.selectedAllSems==false){
         this.selectedAllSems=true;
         this.butSems="Un-Check";
         this.semester="dark"; 
        this.selectedSemesters = this.semesters;
        }
        else{
          this.selectedAllSems=false;
          this.butSems="Check";
          this.semester="outline-dark";
          this.selectedSemesters=[];
        }
      },
      generate() {
        console.log(this.selectedFaculties);
        console.log(this.selectedSemesters);
        console.log(this.selectedYears);
        this.showTable=false;
        //ADD post request here based on above three fields


        axios
		.post(`${obj.ip}/services/find/filter`, {
			token: `${obj.token}`,
			faculties: `${this.selectedFaculties}`,
			semester: `${this.selectedSemesters}`,
			years: `${this.selectedYears}`
		})
		.then(
			response => {
				//console.log(response.data);
				this.items = response.data;
			},
			error => {
				alert(error);
				obj.token = "";
				console.log(error);
			}
		);
        // sorry couldnt map id and faculties

        // fetch [selected faculties] IN [all faculties]  from view directly

      },
	  print() {
	  axios({
			url: `${obj.ip}/services/find/print`,
			method: 'POST',
			responseType: 'blob',
			data: {
				token: `${obj.token}`
			}
		}).then((response) => {
			const url = window.URL.createObjectURL(new Blob([response.data]));
			const link = document.createElement('a');
			link.href = url;
			link.setAttribute('download', 'Report.xlsx');
			//document.body.appendChild(link);
			link.click();
			this.showTable=true;
			this.items = [];
		});
	  }
     
    }
  }
</script>