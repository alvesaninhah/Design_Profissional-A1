const express = require('express');
const router = express.Router();
const userDB = require("../db/dbUser");

// Create 
router.post("/", async (req, res) =>{
  const user = req.body;
  console.log(user);
  try {
    const [result] = await userDB.insert(user);
    res.status(201).json({
      message: `Cadastro realizado com sucesso id ${result.insertId}`,
    });
  } catch (err) {
    console.log(err);
    res.status(500).json({message: "Erro ao cadastrar usuario"}); 
  }
});

//Read
router.get("/", async (_req, res) => {
    try {
      const [result] = await userDB.select();
      res.status(200).json({ result });
    } catch (err) {
      console.log(err);
      res
        .status(500)
        .json({message: "Ocorreu um erro ao busca os dados"});
    }
});

//Update
router.put("/", async (req, res) => {
  const user = req.query;
  const userB = req.body;

  try {
    const [result] = await userDB.update(user.id, userB);
    res.status(200).json({
      message: `Atualizado com  sucesso o id ${user.id}`});
  } catch (err) {
    console.log(err);
    res
      .status(500)
      .json({message: "Ocorreu um erro ao busca os dados"});
  }
});

//Delete
router.delete("/", async (req, res) => {
  const user = req.query;

  try {
    const [result] = await userDB.delet(user.id);
    res.status(200).json({
      message: `Deletado com  sucesso id ${user.id}`});
  } catch (err) {
    console.log(err);
    res
      .status(500)
      .json({message: "Ocorreu um erro ao busca os dados"});
  }
});

module.exports = router;