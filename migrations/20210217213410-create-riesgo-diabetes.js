'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('riesgo_diabetes', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      puntaje_x_edad_id: {
        type: Sequelize.INTEGER
      },
      imc_id: {
        type: Sequelize.INTEGER
      },
      perim_abdomen_id: {
        type: Sequelize.INTEGER
      },
      activ_fisica_id: {
        type: Sequelize.INTEGER
      },
      entrevista_id: {
        type: Sequelize.INTEGER
      },
      cons_frutas_id: {
        type: Sequelize.INTEGER
      },
      medicamentos_hta_id: {
        type: Sequelize.INTEGER
      },
      nivel_glucosa_id: {
        type: Sequelize.INTEGER
      },
      familia_diabeticos_id: {
        type: Sequelize.INTEGER
      },
      riesgo_diabetes: {
        type: Sequelize.INTEGER
      },
      puntaje: {
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
    await queryInterface.dropTable('riesgo_diabetes');
  }
};