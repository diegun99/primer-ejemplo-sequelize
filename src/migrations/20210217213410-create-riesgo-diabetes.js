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
        type: Sequelize.INTEGER,
        references: {
          allowNull: false,
          model: 'puntaje_x_edad',
          key: 'id'
        }
        
      },
      imc_id: {
        type: Sequelize.INTEGER,
        references: {
          allowNull: false,
          model: 'imc',
          key: 'id'
        }
      },
      perim_abdomen_id: {
        type: Sequelize.INTEGER,
        references: {
          allowNull: false,
          model: 'perim_abdomen',
          key: 'id'
        }
      },
      activ_fisica_id: {
        type: Sequelize.INTEGER,
        references: {
          allowNull: false,
          model: 'activ_fisica',
          key: 'id'
        }
      },
      entrevistado_id: {
        type: Sequelize.INTEGER,
        references: {
          allowNull: false,
          model: 'entrevistado',
          key: 'id'
        }
      },
      cons_frutas_id: {
        type: Sequelize.INTEGER,
        references: {
          allowNull: false,
          model: 'cons_frutas',
          key: 'id'
        }
      },
      medicamentos_hta_id: {
        type: Sequelize.INTEGER,
        references: {
          allowNull: false,
          model: 'medicamentos_hta',
          key: 'id'
        }
      },
      nivel_glucosa_id: {
        type: Sequelize.INTEGER,
        references: {
          allowNull: false,
          model: 'nivel_glucosa',
          key: 'id'
        }
      },
      familia_diabeticos_id: {
        type: Sequelize.INTEGER,
        references: {
          allowNull: false,
          model: 'familia_diabeticos',
          key: 'id'
        }
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