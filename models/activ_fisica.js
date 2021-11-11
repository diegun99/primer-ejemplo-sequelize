'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class activ_fisica extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      this.hasMany(models.riesgo_diabetes, {
        foreignKey: 'activ_fisica_id'
      });
    }
  };
  activ_fisicas.init({
    descripcion: DataTypes.STRING,
    escala: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'activ_fisica',
    freezeTableName: true,
    name: {
      singular: 'activ_fisica',
      plural: 'activ_fisica'
    }
  });
  return activ_fisica;
};