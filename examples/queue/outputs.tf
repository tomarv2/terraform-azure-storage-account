#-----------------------------------------------
# Storage Queue
#-----------------------------------------------
output "storage_queues" {
  description = "storage queue names."
  value       = module.queue.asq_names
}
