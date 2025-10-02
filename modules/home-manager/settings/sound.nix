{
  config,
  pkgs,
  self,
  ...
}: {
  # https://github.com/werman/noise-suppression-for-voice
  # https://discourse.nixos.org/t/pipewire-unable-to-set-filter-chain-via-configuration-nix/21972
  xdg.configFile = {
    "pipewire/pipewire.conf.d/99-input-denoising.conf".text = ''
      context.modules = [
          {   name = libpipewire-module-filter-chain
              args = {
                  node.description =  "Noise Canceling source"
                  media.name =  "Noise Canceling source"
                  filter.graph = {
                      nodes = [
                          {
                              type = ladspa
                              name = rnnoise
                              plugin = "${pkgs.rnnoise-plugin}/lib/ladspa/librnnoise_ladspa.so"
                              label = noise_suppressor_mono
                              control = {
                                  "VAD Threshold (%)" = 50.0
                                  "VAD Grace Period (ms)" = 200
                                  "Retroactive VAD Grace (ms)" = 0
                              }
                          }
                      ]
                  }
                  capture.props = {
                      node.name =  "capture.rnnoise_source"
                      node.passive = true
                      audio.rate = 48000
                  }
                  playback.props = {
                      node.name =  "rnnoise_source"
                      media.class = Audio/Source
                      audio.rate = 48000
                  }
              }
          }
      ]'';

    # multiple output audio stream
    "pipewire/pipewire.conf.d/combine-stream.conf".text = ''
      context.modules = [
          {   name = libpipewire-module-combine-stream
              args = {
                  combine.mode = sink
                  node.name = "combine_sink"
                  node.description = "Combine Sink"
                  combine.latency-compensate = false
                  combine.props = {
                      audio.position = [ FL FR ]
                  }
                  stream.props = {
                  }
                  stream.rules = [
                      {
                          matches = [
                              # any of the items in matches needs to match, if one does,
                              # actions are emitted.
                              {
                                  # all keys must match the value. ! negates. ~ starts regex.
                                  #node.name = "~alsa_input.*"
                                  media.class = "Audio/Sink"
                              }
                          ]
                          actions = {
                              create-stream = {
                                  #combine.audio.position = [ FL FR ]
                                  #audio.position = [ FL FR ]
                              }
                          }
                      }
                  ]
              }
          }
      ]'';
  };
}
