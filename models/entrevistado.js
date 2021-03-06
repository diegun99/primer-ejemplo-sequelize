'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class entrevistado extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      entrevistado.belongsTo(models.tipo_documento);
      entrevistado.belongsTo(models.estado_civil);
      entrevistado.belongsTo(models.nivel_educativo);
      entrevistado.belongsTo(models.estrato_id);
      entrevistado.belongsTo(models.regimen_salud_id);
      entrevistado.belongsTo(models.genero_id);

      entrevistado.hasMany(models.tamizaje ,{
        foreignKey: 'entrevista_id',
        as: 'tamizaje'
      });

      entrevistado.hasMany(models.riesgo_diabetes, {
        foreignKey: 'entrevista_id',
        as: 'riesgo_diabetes'

      });
      
      
    }
  };
  entrevistado.init({
    entrevista_id: DataTypes.INTEGER,
    num_documento: DataTypes.INTEGER,
    tipo_documento: DataTypes.STRING,
    num_telefono: DataTypes.INTEGER,
    estado_civil: DataTypes.INTEGER,
    nivel_educativo: DataTypes.INTEGER,
    edad: DataTypes.INTEGER,
    estrato_id: DataTypes.INTEGER,
    regimen_salud_id: DataTypes.INTEGER,
    eps: DataTypes.STRING,
    zona_residencia: DataTypes.STRING,
    direccion: DataTypes.STRING,
    estudia_actualmente: DataTypes.INTEGER,
    trabaja_actualmente: DataTypes.INTEGER,
    hijos: DataTypes.INTEGER,
    num_hijos: DataTypes.INTEGER,
    dependencia_economica: DataTypes.INTEGER,
    genero_id: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'entrevistado',
  });
  return entrevistado;
};