'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('entrevistados', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      entrevista_id: {
        type: Sequelize.INTEGER
      },
      num_documento: {
        type: Sequelize.INTEGER
      },
      tipo_documento: {
        type: Sequelize.STRING
      },
      num_telefono: {
        type: Sequelize.INTEGER
      },
      estado_civil: {
        type: Sequelize.INTEGER
      },
      nivel_educativo: {
        type: Sequelize.INTEGER
      },
      edad: {
        type: Sequelize.INTEGER
      },
      estrato_id: {
        type: Sequelize.INTEGER
      },
      regimen_salud_id: {
        type: Sequelize.INTEGER
      },
      eps: {
        type: Sequelize.STRING
      },
      zona_residencia: {
        type: Sequelize.STRING
      },
      direccion: {
        type: Sequelize.STRING
      },
      estudia_actualmente: {
        type: Sequelize.INTEGER
      },
      trabaja_actualmente: {
        type: Sequelize.INTEGER
      },
      hijos: {
        type: Sequelize.INTEGER
      },
      num_hijos: {
        type: Sequelize.INTEGER
      },
      dependencia_economica: {
        type: Sequelize.INTEGER
      },
      genero_id: {
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
    await queryInterface.dropTable('entrevistados');
  }
};