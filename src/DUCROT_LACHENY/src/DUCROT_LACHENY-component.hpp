#ifndef OROCOS_DUCROT_LACHENY_COMPONENT_HPP
#define OROCOS_DUCROT_LACHENY_COMPONENT_HPP

#include <rtt/RTT.hpp>

class DUCROT_LACHENY : public RTT::TaskContext{
  public:
    DUCROT_LACHENY(std::string const& name);
    bool configureHook();
    bool startHook();
    void updateHook();
    void stopHook();
    void cleanupHook();
};
#endif
