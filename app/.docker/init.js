db = db.getSiblingDB("admin");

db.createUser(
    {
        user: "beats",
        pwd: "beats",
        roles: ["clusterMonitor"]
    }
)

db.grantRolesToUser("beats", ["clusterMonitor"])