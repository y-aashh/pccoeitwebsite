<template>
  <div>
    <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">

          <div class="modal-header">
            <slot name="header">
              default header
            </slot>
          </div>

          <div class="modal-body">
            <slot name="body">
                <b>Faculty Name</b> : {{propObj[0].faculty_name}} <br>
                <b>Workshop </b>: {{propObj[0].workshop_name}} <br>
                <b>Interaction </b>: {{propObj[0].interaction_type}} <br>
                <b>Duration </b>: {{propObj[0].duration}} <br>
                <b>Start Date </b>: {{propObj[0].start_date}} <br>
                <b>Organized By</b> : {{propObj[0].organized_by}}
            </slot>
          </div>
          <div class="modal-footer">
            <slot name="footer">
              <b-button class="modal-default-button" variant="outline-primary" @click="$emit('close')">
                OK
              </b-button>
            </slot>
          </div>
        </div>
      </div>
    </div>
  </transition>
  </div>
</template>



<style scoped>
.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, .5);
  display: table;
  transition: opacity .3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.modal-container {
  width: 800px;
  margin: 0px auto;
  padding: 20px 30px;
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, .33);
  transition: all .3s ease;
  font-family: Helvetica, Arial, sans-serif;
}

.modal-header h3 {
  margin-top: 0;
  color: #42b983;
}

.modal-body {
  margin: 20px 0;
}

.modal-default-button {
  float: right;
}

/*
 * The following styles are auto-applied to elements with
 * transition="modal" when their visibility is toggled
 * by Vue.js.
 *
 * You can easily play with the modal transition by editing
 * these styles.
 */

.modal-enter {
  opacity: 0;
}

.modal-leave-active {
  opacity: 0;
}

.modal-enter .modal-container,
.modal-leave-active .modal-container {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
</style>

<script>
export default {
  name: "modal",
    props: {
    // type, required and default are optional, you can reduce it to 'options: Object'
    propObj: { type: Object, required: true, default: {"test": "wow"}},
  },
  data :{
    splited:[]
  },
  mounted(){
    this.propObj[0].start_date=this.propObj[0].start_date.split('T')[0];
    console.log(this.propObj[0].start_date);
  }
};
</script>