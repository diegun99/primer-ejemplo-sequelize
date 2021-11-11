'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('entrevistado', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      num_documento: {
        type: Sequelize.INTEGER
      },
      tipo_documento_id: {
        type: Sequelize.INTEGER,
        references: {
          allowNull: false,
          model: 'tipo_documento',
          key: 'id'
        }
      },
      num_telefono: {
        type: Sequelize.INTEGER
      },
      estado_civil_id: {
        type: Sequelize.INTEGER,
        references: {
          allowNull: false,
          model: 'estado_civil',
          key: 'id'
        }
      },
      nivel_educativo_id: {
        type: Sequelize.INTEGER,
        references: {
          allowNull: false,
          model: 'nivel_educativo',
          key: 'id'
        }
      },
      edad: {
        type: Sequelize.INTEGER
      },
      estrato_socioeconomico_id: {
        type: Sequelize.INTEGER,
        references: {
          allowNull: false,
          model: 'estrato_socioeconomico',
          key: 'id'
        }
      },
      regimen_salud_id: {
        type: Sequelize.INTEGER,
        references: {
          allowNull: false,
          model: 'regimen_salud',
          key: 'id'
        }
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
        type: Sequelize.INTEGER,
        references: {
          allowNull: false,
          model: 'genero',
          key: 'id'
        }
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
    await queryInterface.dropTable('entrevistado');
  }
};