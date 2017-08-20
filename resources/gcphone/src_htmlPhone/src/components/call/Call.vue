<template>
  <div class="screen">
    <list :list='callList' title="Téléphone" :disable='ignoreControls' v-on:select="onSelect"></list>
  </div>
</template>

<script>
import List from './../List.vue'
import request from '../../request'
import Modal from '@/components/Modal/index.js'

export default {
  components: {
    List
  },
  data () {
    return {
      title: 'Téléphone',
      ignoreControls: false,
      callList: [{
        display: 'Police',
        subMenu: [
          {title: 'Appel police', eventName: 'police'}
        ]
      }, {
        display: 'Ambulance',
        subMenu: [
          {title: 'Appel ambulance', eventName: 'medic'}
        ]
      }]
    }
  },
  methods: {
    onSelect: function (call) {
      if (this.ignoreControls === true) return
      this.ignoreControls = true
      Modal.CreateModal({choix: [...call.subMenu, {title: 'Retour'}]}).then(rep => {
        this.ignoreControls = false
        if (rep.title === 'Retour') return
        request.callEvent(rep.eventName, rep.type)
      })
    },
    onBackspace: function () {
      if (this.ignoreControls === true) return
      history.back()
    }
  },

  created: function () {
    this.$bus.$on('keyUpBackspace', this.onBackspace)
  },
  beforeDestroy: function () {
    this.$bus.$off('keyUpBackspace', this.onBackspace)
  }
}
</script>

<style scoped>
.screen{
  position: relative;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
}
</style>
