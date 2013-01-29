#!/usr/bin/ruby
class Query_operations
  def self.command(x)
    username=x["banner"]["username"].split("/")[-1]  
    if (x["banner"]["command"].nil?)
      x1="unknown"
      case username
      when "yysun"
        x1 = "vasp"
      when "pennyctj"
        x1 = "vasp"
      when "mikre"
        x1 = "pentamd"
      when "ching"
        x1 = "vasp"
      when "jmoussa"
        x1 = "vasp"
      when "yiwang62"
        x1 = "vasp"
      when "guoxiong"
        x1 = "namd"
      when "jmweresz"
        x1 = "namd"
      when "mscheung"
        x1 = "namd"
      when "chengsf"
        x1 = "lammps"
      when "dozh0218"
        x1 = "lammps"
      when "hmarsh"
        x1 = "lammps"
      when "ianyappy"
        x1 = "sseqmc"
      when "btemelso"
        x1 = "molpro"
      when "cfbrush"
        x1 = "iwfm"
      when "dogrul"
        x1 = "iwfm"
      when "xuchun"
        x1 = "smatrix"
      when "vranjbar"
        x1 = "impact"
      when "yargk"
        x1 = "vasp"
      when "yhtseng"
        x1 = "ccsm"
      when "bcovello"
        x1 = "jfdtd"
      when "bmuite"
        x1 = "martensitec"
      when "miller1"
        x1 = "wrf"
      end
    else
      x1 = x["banner"]["command"]
    end

    return x1

  end
end
