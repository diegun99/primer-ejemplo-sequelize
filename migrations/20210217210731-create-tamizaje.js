'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('tamizajes', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      peso: {
        type: Sequelize.DOUBLE
      },
      imc: {
        type: Sequelize.DOUBLE
      },
      perimetro_abdominal: {
        type: Sequelize.DOUBLE
      },
      tension_arterial: {
        type: Sequelize.INTEGER
      },
      actividad_fisica: {
        type: Sequelize.INTEGER
      },
      entrevista_id: {
        type: Sequelize.INTEGER
      },
      interpretacion_imc_id: {
        type: Sequelize.INTEGER
      },
      frec_cons_frutas_id: {
        type: Sequelize.INTEGER
      },
      hipertension: {
        type: Sequelize.INTEGER
      },
      medicamentos_hta: {
        type: Sequelize.STRING
      },
      nivel_azucar: {
        type: Sequelize.STRING
      },
      diagnostico_diabetes_id: {
        type: Sequelize.INTEGER
      },
      es_diabetico: {
        type: Sequelize.INTEGER
      },
      fuma: {
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
    await queryInterface.dropTable('tamizajes');
  }
};