#! /bin/zsh

monitor_gpus() {

  igpu=$(timeout 1s intel_gpu_top -c | head -n 2 | tail -n 1 | awk -F',' '{print $7 + $10 + $13 + $16}')
  dgpu=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits -i GPU-05395229-4e14-1d18-f780-a518b3612e01)
  egpu=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits -i GPU-7e542696-0d0e-5f40-c250-4e31f68d7af6)

  if [ "$egpu" = "No devices were found" ]; then
    egpu=0
  fi

  jq -n \
    --arg igpu "$igpu" \
    --arg dgpu "$dgpu" \
    --arg egpu "$egpu" \
    '{igpu: $igpu, dgpu: $dgpu, egpu: $egpu}'
}

monitor_gpus

