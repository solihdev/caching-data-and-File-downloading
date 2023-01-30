class FileModel{
  String fileName;
  String fileUrl;

  FileModel({required this.fileName,required this.fileUrl});
}

List files=[
  FileModel(fileName: "Ronaldo.jpg", fileUrl: "https://images.beinsports.com/ALZ9-lFz8NdnCwI0eXadFKaFcUs=/full-fit-in/1000x0/4574680-2023-01-03T174530Z_1779681513_UP1EJ131DBSBQ_RTRMADP_3_SOCCER-SAUDI-RONALDO.JPG"),
  FileModel(fileName: "kitob.pdf", fileUrl: "https://dl.tuit.uz/subject-resources/70807/3p6luV0hDf5B3bFfMOFzdhbYuHCymYkulOCsQN4U.pdf"),
  FileModel(fileName: "kitob2.pdf", fileUrl: "https://dl.tuit.uz/subject-resources/70807/3p6luV0hDf5B3bFfMOFzdhbYuHCymYkulOCsQN4U.pdf"),
];