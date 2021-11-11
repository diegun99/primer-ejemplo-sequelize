'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class riesgo_diabetes extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here

      this.belongsTo(models.puntaje_x_edad, {
        foreignKey: 'puntaje_x_edad_id'
      });

      this.belongsTo(models.imc, {
        foreignKey: 'imc_id'
      });
      this.belongsTo(models.perim_abdomen, {
        foreignKey: 'perim_abdomen_id'
      });
      this.belongsTo(models.activ_fisica, {
        foreignKey: 'activ_fisica_id'
      });
      this.belongsTo(models.entrevistado, {
        foreignKey: 'entrevistado_id'
      });
      this.belongsTo(models.cons_frutas, {
        foreignKey: 'cons_frutas_id'
      });
      this.belongsTo(models.medicamentos_hta, {
        foreignKey: 'medicamentos_hta_id'
      });
      this.belongsTo(models.nivel_glucosa, {
        foreignKey: 'nivel_glucosa_id'
      });
      this.belongsTo(models.familia_diabeticos, {
        foreignKey: 'familia_diabeticos_id'
      });
    }
  };
  riesgo_diabetes.init({
    puntaje_x_edad_id: DataTypes.INTEGER,
    imc_id: DataTypes.INTEGER,
    perim_abdomen_id: DataTypes.INTEGER,
    activ_fisica_id: DataTypes.INTEGER,
    entrevistado_id: DataTypes.INTEGER,
    cons_frutas_id: DataTypes.INTEGER,
    medicamentos_hta_id: DataTypes.INTEGER,
    nivel_glucosa_id: DataTypes.INTEGER,
    familia_diabeticos_id: DataTypes.INTEGER,
    riesgo_diabetes: DataTypes.INTEGER,
    puntaje: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'riesgo_diabetes',
    freezeTableName: true,
    name: {
      singular: 'riesgo_diabetes',
      plural: 'riesgo_diabetes'
    }
  });
  return riesgo_diabetes;
};