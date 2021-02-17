'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('riesgo_cardiovasculars', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      diabetes: {
        type: Sequelize.INTEGER
      },
      genero: {
        type: Sequelize.INTEGER
      },
      fumador: {
        type: Sequelize.INTEGER
      },
      presion_arterial: {
        type: Sequelize.INTEGER
      },
      color: {
        type: Sequelize.STRING
      },
      puntaje_base: {
        type: Sequelize.INTEGER
      },
      calculo_rcv: {
        type: Sequelize.INTEGER
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('riesgo_cardiovasculars');
  }
};