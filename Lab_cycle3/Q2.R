# Graph

# Create adjacency list representation for an undirected graph
create_adjacency_list <- function(edges) {
  adj_list <- list()
  
  # Initialize adjacency list for each vertex in edges
  for (edge in edges) {
    v1 <- edge[1]
    v2 <- edge[2]
    
    # Initialize adjacency lists for each vertex if they don't exist
    if (is.null(adj_list[[as.character(v1)]])) adj_list[[as.character(v1)]] <- c()
    if (is.null(adj_list[[as.character(v2)]])) adj_list[[as.character(v2)]] <- c()
    
    # Add edges (undirected)
    adj_list[[as.character(v1)]] <- c(adj_list[[as.character(v1)]], v2)
    adj_list[[as.character(v2)]] <- c(adj_list[[as.character(v2)]], v1)
  }
  return(adj_list)
}

# Function to add an edge between two vertices in the graph
add_edge <- function(adj_list, v1, v2) {
  # Initialize adjacency lists for each vertex if they don't exist
  if (is.null(adj_list[[as.character(v1)]])) adj_list[[as.character(v1)]] <- c()
  if (is.null(adj_list[[as.character(v2)]])) adj_list[[as.character(v2)]] <- c()
  
  adj_list[[as.character(v1)]] <- c(adj_list[[as.character(v1)]], v2)
  adj_list[[as.character(v2)]] <- c(adj_list[[as.character(v2)]], v1)
  return(adj_list)
}

# DFS traversal on a graph starting from a specific vertex
dfs_traversal <- function(adj_list, start, visited = NULL) {
  # Convert start to character to match list indexing
  start <- as.character(start)
  
  # Initialize visited with enough entries to cover all vertices in adj_list
  if (is.null(visited)) visited <- setNames(rep(FALSE, length(adj_list)), names(adj_list))
  
  visited[start] <- TRUE
  cat(start, " ")
  
  for (neighbor in adj_list[[start]]) {
    neighbor <- as.character(neighbor)  # Ensure neighbor is a character for indexing
    if (!visited[neighbor]) {
      visited <- dfs_traversal(adj_list, neighbor, visited)
    }
  }
  return(visited)
}

edges <- list(
  c(1, 2), c(1, 5), c(2, 3), c(2, 4),
  c(5, 6), c(6, 7), c(7, 8), c(8, 9), 
  c(3, 9), c(3, 10), c(10, 11), c(11, 12),
  c(12, 1))

# Step 1: Create adjacency list
adj_list <- create_adjacency_list(edges)
print("Initial adjacency list:")
print(adj_list)

# Step 2: Add an additional edge to increase complexity
adj_list <- add_edge(adj_list, 9, 12)
print("Adjacency list after adding edge (9, 12):")
print(adj_list)

# Step 3: Perform DFS traversal starting from vertex 1
cat("DFS traversal starting from vertex 1:\n")
visited <- dfs_traversal(adj_list, 1)
