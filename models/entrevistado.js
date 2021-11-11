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
      this.belongsTo(models.tipo_documento, {
        foreignKey: 'tipo_documento_id'
      })
      this.belongsTo(models.estado_civil, {
        foreignKey: 'estado_civil_id'
      })
      this.belongsTo(models.nivel_educativo, {
        foreignKey: 'nivel_educativo_id'
      })
      this.belongsTo(models.estrato_socioeconomico, {
        foreignKey: 'estrato_socioeconomico_id'
      })
      this.belongsTo(models.regimen_salud, {
        foreignKey: 'regimen_salud_id'
      })
      this.belongsTo(models.genero, {
        foreignKey: 'genero_id'
      })

      entrevistado.hasMany(models.tamizaje ,{
        foreignKey: 'entrevistado_id'
      });

      entrevistado.hasMany(models.riesgo_diabetes, {
        foreignKey: 'entrevistado_id'
      });
      
      
    }
  };
  entrevistado.init({
    num_documento: DataTypes.INTEGER,
    tipo_documento_id: DataTypes.INTEGER,
    num_telefono: DataTypes.STRING,
    estado_civil_id: DataTypes.INTEGER,
    nivel_educativo_id: DataTypes.INTEGER,
    edad: DataTypes.INTEGER,
    estrato_socioeconomico_id: DataTypes.INTEGER,
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
    freezeTableName: true,
    name: {
      singular: 'entrevistado',
      plural: 'entrevistado'
    }
  });
  return entrevistado;
};