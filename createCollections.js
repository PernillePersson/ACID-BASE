use socialMedia;

db.createCollection("users");
db.createCollection("posts");

// Indsæt brugere
db.users.insertMany([
  {
    _id: "user1",
    name: "Victoria",
    email: "victoria@example.com",
    profilePic: "victoria.jpg",
    following: ["user2", "user3"]
  },
  {
    _id: "user2",
    name: "Esben",
    email: "esben@example.com",
    profilePic: "esben.jpg",
    following: ["user1"]
  },
  {
    _id: "user3",
    name: "Thomas",
    email: "thomas@example.com",
    profilePic: "thomas.jpg",
    following: ["user1"]
  },
  {
    _id: "user4",
    name: "Pernille",
    email: "pernille@example.com",
    profilePic: "pernille.jpg",
    following: []
  }
]);

// Indsæt Thomas' post med reactions og kommentarer
db.posts.insertOne({
  _id: "post1",
  authorId: "user3",
  content: "Hej, dette er mit første opslag!",
  timestamp: ISODate("2025-09-23T10:00:00Z"),
  reactions: [
    {
      _id: "reaction1",
      userId: "user1",
      type: "like",
      timestamp: ISODate("2025-09-23T10:05:00Z")
    }
  ],
  comments: [
    {
      _id: "comment1",
      authorId: "user2",
      content: "Fedt opslag, Thomas!",
      timestamp: ISODate("2025-09-23T10:10:00Z"),
      reactions: [
        {
          _id: "reaction2",
          userId: "user4",
          type: "dislike",
          timestamp: ISODate("2025-09-23T10:15:00Z")
        }
      ]
    }
  ]
});
//Kan vi få langauge js op på 50%?
