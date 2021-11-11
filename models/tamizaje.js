'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class tamizaje extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      
      this.belongsTo(models.entrevista, {
        foreignKey: 'entrevista_id'
      });
      this.belongsTo(models.interpretacion_imc, {
        foreignKey: 'interpretacion_imc_id'
      });
      this.belongsTo(models.frec_cons_frutas, {
        foreignKey: 'frec_cons_frutas_id'
      });
      this.belongsTo(models.diagnostico_diabetes, {
        foreignKey: 'diagnostico_diabetes_id'
      });

      tamizaje.hasMany(models.resultado_rcv, {
        foreignKey: 'tamizaje_id',

      });
    }
  };
  tamizaje.init({
    peso: DataTypes.DOUBLE,
    imc: DataTypes.DOUBLE,
    perimetro_abdominal: DataTypes.DOUBLE,
    tension_arterial: DataTypes.INTEGER,
    actividad_fisica: DataTypes.INTEGER,
    entrevista_id: DataTypes.INTEGER,
    interpretacion_imc_id: DataTypes.INTEGER,
    frec_cons_frutas_id: DataTypes.INTEGER,
    hipertension: DataTypes.INTEGER,
    medicamentos_hta: DataTypes.STRING,
    nivel_azucar: DataTypes.STRING,
    diagnostico_diabetes_id: DataTypes.INTEGER,
    es_diabetico: DataTypes.INTEGER,
    fuma: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'tamizaje',
    freezeTableName: true,
    name: {
      singular: 'tamizaje',
      plural: 'tamizaje'
    }
  });
  return tamizaje;
};